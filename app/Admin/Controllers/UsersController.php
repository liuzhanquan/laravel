<?php

namespace App\Admin\Controllers;

use App\Models\Users;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Layout\Content;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Controllers\HasResourceActions;
use App\Admin\Actions\Post\Userdel;
use App\Admin\Actions\Post\UserCoupon;

class UsersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'App\User';

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
        $grid = new Grid(new Users);
        //新增按钮
        //$grid->disableCreateButton();

        $grid->model()->where('status','>=','0');
        $grid->column('id', __('Id'));
        $grid->column('parent_id',__('上级'))->display(function($id){
            $user = Users::find($id);
            if ($user) {
                $parent = $user->openname;
            }else{
                $parent = '没有上级';
            }
            return $parent;
        });
        $grid->column('openid', __('第三方ID'));
        $grid->column('avatar', __('头像'))->image();
        $grid->column('openname', __('用户名'));
        $grid->column('phone', __('手机号'));
        $grid->column('level', __('用户等级'));
        $grid->column('sex', __('性别'))->using(['0'=>'女','1'=>'男']);
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
        $grid->column('expiretime', __('过期时间'));

        $grid->actions(function ($actions) {
            // 去掉删除
            $actions->disableDelete();
            // 添加自定义删除按钮
            $actions->add(new Userdel);
            $actions->add(new UserCoupon);
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
        $show = new Show(Users::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('parent_id','上级')->as(function ($id){
            $user = Users::find($id);
            if ( $user ) {
                return $user->openname;
            }else{
                return '没有上级';
            }
        });
        $show->field('openid', __('第三方ID'));
        $show->field('avatar', __('用户头像'));
        $show->field('phone', __('手机号'));
        $show->field('password', __('登录密码'));
        $show->field('level', __('用户等级'));
        $show->field('sex', __('性别'));
        $show->field('status', __('状态'));
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('最近登录时间'));
        $show->field('expiretime', __('过期时间'));

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
        $form = new Form(new Users);
        
        $form->tools(function (Form\Tools $tools) {
            // 去掉`列表`按钮
            $tools->disableList();
            // 去掉`删除`按钮
            //$tools->disableDelete();
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
            $user = Users::find($id);
            if ( $user ) {
                return [ $user->id => $user->openname ];
            }
        })->ajax('/admin/api/userfind');
        $form->display('openid','第三方ID');
        $form->image('avatar', '用户头像');
        $form->mobile('phone', '手机号')->options(['mask' => '999 9999 9999']);
        $form->password('password', '登录密码');
        $form->number('level','用户等级');
        $form->radio('sex','性别')->options(['0' => '女', '1'=> '男'])->default('0');
        $form->radio('status','状态')->options(['0' => '冻结', '1'=> '启用'])->default('1');
        $form->display('created_at','创建时间');
        $form->display('updated_at','最近登录时间');
        $form->datetime('expiretime','过期时间');

        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = authcode($form->password);
            }
            if(  $form->password == '' ){
                $form->password = $form->model()->password;
            }
        });


        return $form;
    }
}
