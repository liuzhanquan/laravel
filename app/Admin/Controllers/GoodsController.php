<?php

namespace App\Admin\Controllers;


use Encore\Admin\Grid;
use Encore\Admin\Form;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use App\Models\Goods;
use App\Models\Agent;
use Illuminate\Support\Facades\DB;
use Encore\Admin\Widgets\Table;
use App\Admin\Actions\Post\Replicate;
use App\Admin\Actions\Post\Specs;
use Encore\Admin\Controllers\HasResourceActions;

class GoodsController extends Controller
{
    use HasResourceActions;
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('商品');
            $content->description('列表');

            // $content->body($this->filter());
            $content->body($this->grid());
        });
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
                return new Table(['商品ID', '规格属性', '价格','数量','添加时间'], $comments->toArray());
            });
            $grid->title_list('副标题');
            $grid->agent('代理商信息')->display(function($gid){
                return DB::table('agent')->where('id',$gid)->value('name');
            });
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
                //规格属性自定义按钮
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
        $show->field('show_time', __('副标题'));
        $show->field('agent', __('代理商信息'))->as(function ($gid){
            return DB::table('agent')->where('id',$gid)->value('name');
        });
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
        $form->select('agent','代理商')->options(function ($id){
            $agent = DB::table('agent')->find($id);
            if ( $agent ){
                return [ $agent->id => $agent->name ];
            }
        })->ajax('/admin/api/agentfind');
        $form->image('photo','封面图片')->thumbnail('small', $width = 300, $height = 300);
        $form->datetimeRange('show_time', 'hide_time', '定时上架');
        $form->editor('content','详细信息');
        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated At');
            
        return $form;
    }


}
