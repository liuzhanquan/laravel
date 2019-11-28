<?php

namespace App\Admin\Controllers;


use Encore\Admin\Grid;
use Encore\Admin\Form;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use App\Models\Goods;
use Encore\Admin\Widgets\Table;
use App\Admin\Actions\Post\Replicate;
use App\Admin\Actions\Post\Specs;
use Encore\Admin\Controllers\HasResourceActions;
use Illuminate\Http\Request;
use DB;
class GoodsSonController extends Controller
{
    use HasResourceActions;
    
    public function index(Content $content,Request $request,$id = 0)
    {
        //解决页面js冲突无法解析问题
        Admin::disablePjax();
        
        if( $request->isMethod('POST') ){
            empty($request->input('id'))  ? return_json(400,'数据错误') : $id = $request->input('id');
            empty($request->input('list'))  ? return_json(400,'规格属性不能为空') : $list = $request->input('list');
            
            foreach( $list as $key=>$item  ){
                $arr = [];
                $arr['price']   = $item['price'];
                $arr['num']     = $item['num'];
                $arr['type']    = substr($item['title'],1);
                $arr['typelist'] =implode('/',$request->input('typelist'));
                $arr['pid']      = $id;
                $arr['created_at']= date('Y-m-d H:i:s',time());
                $arr['pro_num'] = orderNumCreate();
                $data[] = $arr;
            }
            DB::table('goods_son')->where('pid',$id)->update(['status'=>0]);
            $res = DB::table('goods_son')->insert($data);
            
            if( $res ){
                return ['code'=>200,'message'=>'配置成功！'];
            }else{
                return ['code'=>400,'message'=>'配置失败！'];
            }

        }
        
        $info = DB::table('goods')->where('id',$id)->first();
        $son  = DB::table('goods_son')->where('pid',$id)->get();
        $spectype = DB::table('goods_specs')->get();
        $spectype = navtree($spectype);
        $nspectype = [];
        
        if( $son->first() ){

            $type = explode('/',$son[0]->typelist);
            foreach( $type as $t ){
                if( !array_key_exists($t,$nspectype) ){
                    $nspectype[$t] = [];
                }
            }
            
            foreach( $son as $item ){
                $stype = explode('/',$item->type);
                $pro = explode('/',$son[0]->typelist);
                
                foreach( $stype as $k=>$i ){
                    if( !in_array($i,$nspectype[$pro[$k]]) ){
                        array_push($nspectype[$pro[$k]],$i);
                    }
                }
            }
           
        }

        return $content
                ->header('商品规格属性')
                ->description('管理')
                ->body(view('Admin.specadd')->with(['info'=>$info,'spectype'=>$spectype,'son'=>$son,'nspectype'=>$nspectype]));
    }

    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('商品管理');
            $content->description('添加');

            // $content->body($this->filter());
            $content->body($this->form());
        });
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('编辑')
            ->description('商品管理')
            ->body($this->form()->edit($id));
    }

    public function show($id, Content $content)
    {
        return $content
            ->header('编辑')
            ->description('商品管理')
            ->body($this->detail($id));
    }

     /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(Goods::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            
            $grid->title('标题')->expand(function ($model) {
                
                $comments = $model->GoodsSon($model->id);
                return new Table(['ID', '内容', '发布时间'], $comments->toArray());
            });
            $grid->title_list('副标题');
            $grid->show_time('上架时间')->sortable();
            $grid->hide_time('下架时间')->sortable();
            $grid->column('photo','封面图片')->display(function ($photo) {
                return "<img src='/upload/$photo' style='height:50px;width:50px;' />";
            });
            $grid->filter(function($filter){
                $filter->column(1/2,function($filter){
                    $filter->like('title','标题');
                });
                $filter->column(1/2,function($filter){
                    $filter->between('show_time','上架时间')->datetime();
                    $filter->between('show_time','下架时间')->datetime();
                });

            });
            $grid->actions(function ($actions) {
                $actions->add(new Replicate);
                $actions->add(new Specs);
            });
        });
    }

     /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Goods::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('标题'));
        $show->field('show_time', __('标题'));
        $show->field('hide_time', __('副标题'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Goods);

        $form->tools(function (Form\Tools $tools) {
            $tools->disableView();
            $tools->disableDelete();
        });

        $form->footer(function (Form\Footer $footer) {
            $footer->disableReset();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
            $footer->disableViewCheck();
        });


        $form->display('id', 'ID');
        $form->text('title','标题');
        $form->text('title_list','副标题');
        $form->image('photo','封面图片')->thumbnail('small', $width = 300, $height = 300);
        $form->datetimeRange('show_time', 'hide_time', '定时上架');
        $form->editor('content','详细信息');
        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated At');
            
        return $form;
    }


}
