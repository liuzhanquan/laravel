<?php

namespace App\Admin\Controllers;

use App\Models\Agent;
use App\Models\Users;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Layout\Content;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Controllers\HasResourceActions;
use Illuminate\Support\Facades\DB;
use App\Admin\Actions\Post\Agentdel;

class AgentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '代理商';

    //使用自带的显示，删除方法
    use HasResourceActions;

    public function index(Content $content)
    {
        $content->header('用户');
        $content->description('列表');

        $content->body($this->grid());

        return $content;
    }
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Agent);
        //新增按钮
        //$grid->disableCreateButton();

        $grid->model()->where('status','>=','0');
        $grid->column('id', __('Id'));
        $grid->column('parent_id',__('上级'))->display(function($id){
            $user = Agent::find($id);
            if ($user) {
                $parent = $user->openname;
            }else{
                $parent = '没有上级';
            }
            return $parent;
        });
        $grid->column('name', __('名称'));
        $grid->column('headerimg', __('头像'))->image();
        $grid->column('photo', __('证件图片'))->image();
        $grid->column('photo_two', __('证件副图片'))->image();
        $grid->column('card', __('证件号'));
        $grid->column('level', __('商家等级'));
        $grid->column('price', __('金额'));
        $grid->column('level', __('商家等级'));
        $grid->column('addrlist', __('商家地址'))->display(function (){
            return $this->province.'-'.$this->city.'-'.$this->area.'-'.$this->addrlist;
        });
        $grid->column('status', __('状态'))->display(function($status){
             if( $status == 1 ){
                $str = '启用';
             }else if( $status == 0 ){
                $str = '冻结';
             }else{
                $str = '未处理';
             }
             return $str;
        });
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('最近登录时间'));

        $grid->actions(function ($actions) {
            // 去掉删除
            $actions->disableDelete();
            // 添加自定义删除按钮
            $actions->add(new Agentdel);
        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Agent::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('parent_id','上级')->as(function ($id){
            $list = Agent::find($id);
            if ( $list ) {
                return $list->name;
            }else{
                return '没有上级';
            }
        });
        $show->field('uid','用户信息')->as(function ($id){
            $list = Users::find($id);
            if ( $list ) {
                return $list->openname;
            }
        });
        $show->field('name', __('代理商名称'));
        $show->headerimg('代理商头像')->image();
        $show->photo('证件图片')->image();
        $show->photo_two('证件副图片')->image();
        $show->field('level', __('代理商等级'));
        $show->field('area', __('地址'))->as(function(){
            return $this->province.'-'.$this->city.'-'.$this->area.'-'.$this->addrlist;
        });
        $show->field('status', __('状态'))->using(['-1'=>'删除','0'=>'冻结','1'=>'启用']);
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('最近登录时间'));

        return $show;
    }

    /** 
     * 重写删除方法
     * 
     * 
     * destroy
    **/
    public function destroy($id){
        dd(11);
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Agent);
        
        $form->tools(function (Form\Tools $tools) {
            // 去掉`列表`按钮
            $tools->disableList();
            // 去掉`删除`按钮
            $tools->disableDelete();
            // 去掉`查看`按钮
            $tools->disableView();
            // 添加一个按钮, 参数可以是字符串, 或者实现了Renderable或Htmlable接口的对象实例
            //$tools->add('<a class="btn btn-sm btn-danger"><i class="fa fa-trash"></i>&nbsp;&nbsp;delete</a>');
        });

        $form->footer(function ($footer) {
            // 去掉`重置`按钮
            $footer->disableReset();
            // 去掉`提交`按钮
            //$footer->disableSubmit();
            // 去掉`查看`checkbox
            $footer->disableViewCheck();
            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();
            // 去掉`继续创建`checkbox
            $footer->disableCreatingCheck();
        
        });

        $form->display('id','ID');
        $form->select('parent_id','上级')->options(function ($id){
            $agent = Agent::find($id);
            if ( $agent ) {
                return [ $agent->id => $agent->name ];
            }
        })->ajax('/admin/api/agentfind');
        $form->select('uid','用户信息')->options(function ($id){
            $user = Users::find($id);
            if ( $user ) {
                return [ $user->id => $user->openname ];
            }
        })->ajax('/admin/api/userfind')->rules('required');
        $form->text('name','代理商名称')
            ->creationRules(['required', "unique:agent"])
            ->updateRules(['required', "unique:agent,name,{{id}}"]);
        $form->image('headerimg', '头像');
        $form->image('photo', '证件图片');
        $form->image('photo_two', '证件副图片');
        $form->number('price','金额');
        $form->number('level','代理商等级');
        $form->distpicker(['province_id', 'city_id', 'area_id']);
        $form->text('addrlist','详细地址');
        $form->radio('status','状态')->options(['0' => '冻结', '1'=> '启用'])->default('1');
        $form->display('created_at','创建时间');
        $form->display('updated_at','最近登录时间');
        $form->hidden('province');
        $form->hidden('city');
        $form->hidden('area');
        $form->saving(function (Form $form) {
            $form->province = DB::table('china_area')->where('code',$form->province_id)->value('name');
            $form->city = DB::table('china_area')->where('code',$form->city_id)->value('name');
            $form->area = DB::table('china_area')->where('code',$form->area_id)->value('name');
            
        });
        

        return $form;
    }
}
