<?php

namespace App\Admin\Controllers;

use App\Models\Users;
use App\Models\Coupon;
use App\Models\UserCoupon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Layout\Content;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Controllers\HasResourceActions;
use App\Admin\Actions\Post\DelStatus;

class UserCouponController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '用户优惠券';

    //使用自带的显示，删除方法
    use HasResourceActions;

    public function index(Content $content)
    {
        $content->header('用户优惠券');
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
        $grid = new Grid(new UserCoupon);
        //新增按钮
        //dd(request()->query()['q']);
        //$grid->disableCreateButton();
        $where[] = ['status','>=','0'];
        
        if ( !empty( request()->query()['uid'] ) ) {
            $where[] = ['uid','=',request()->query()['uid']];
        }
        $grid->model()->where($where);
        $grid->column('id', __('Id'));
        $grid->column('uid', __('用户信息'))->display(function ($id){
            $user = Users::find($id);
            return $user->openname;
        });
        $grid->column('cid', __('优惠券信息'))->display(function ($id){
            $C = new Coupon();
            $data = $C->getinfo($id);
            
            return $data['str'];
        });
        $grid->column('use_status', __('是否使用'))->using(['0'=>'已使用','1'=>'未使用']);
        $grid->column('show', __('显示'))->bool();
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
        $grid->column('show_time', __('使用时间'))->display(function(){
            return $this->show_time.'<br/>'.$this->hide_time;
        });
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();
        
            // 在这里添加字段过滤器
            $filter->equal('uid','用户id');

            $filter->where(function ($query) {

                $query->whereHas('users', function ($query) {
                    $query->where('openname', 'like', "%{$this->input}%");
                });
            
            }, '用户名称');
            
        });

        $grid->actions(function ($actions) {
            // 去掉删除
            $actions->disableDelete();
            // 添加自定义删除按钮
            $actions->add(new DelStatus);
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
        $show = new Show(UserCoupon::findOrFail($id));

        $show->panel()
                ->tools(function ($tools) {
                    //$tools->disableEdit();
                    //$tools->disableList();
                    $tools->disableDelete();
                });

        $show->field('id', __('Id'));
        $show->field('uid','上级')->as(function ($id){
            $user = Users::find($id);
            if ( $user ) {
                return $user->openname;
            }
        });
        $show->field('cid', __('优惠券'))->as(function ($id){
            $C = new Coupon();
            $data = $C->getinfo($id);
            
            return $data['str'];
        });
        $show->field('use_status', __('是否使用'))->using(['0'=>'已使用','1'=>'未使用']);
        $show->field('status', __('状态'))->using(['0'=>'未启用','1'=>'启用']);
        $show->field('show_time', __('使用时间'))->as(function (){
            return $this->show_time.' —— '.$this->hide_time;
        });
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
        $form = new Form(new UserCoupon);
        
        $form->tools(function (Form\Tools $tools) {
            // 去掉`列表`按钮
            //$tools->disableList();
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
        $form->select('uid','用户')->options(function ($id){
            $user = Users::find($id);
            if ( $user ) {
                return [ $user->id => $user->openname ];
            }
        })->ajax('/admin/api/userfind')->rules('required',['required'=>'用户不能为空']);;
        $form->select('cid','优惠券')->options(function ($id){
            if( $id ){
                $C = new Coupon();
                $data = $C->getinfo($id);
                
                if ( $data ) {
                    return [ $data['id'] => $data['str'] ];
                }
            }
        })->ajax('/admin/api/couponSel')->rules('required',['required'=>'优惠券不能为空']);
        $form->radio('use_status','是否使用')->options(['0' => '已使用', '1'=> '未使用'])->default('1');
        $form->radio('status','状态')->options(['0' => '冻结', '1'=> '启用'])->default('1');
        $form->radio('show','是否显示')->options(['0' => '不显示', '1'=> '显示'])->default('1');
        $form->datetimeRange('show_time','hide_time', '(不填默认优惠券时间)使用时间');
        $form->display('created_at','创建时间');
        $form->display('updated_at','更新时间');

        $form->saving(function (Form $form) {
            $info = Coupon::find($form->cid);
            
            if( $form->show_time == '' ){
                $form->show_time = $info->show_time;
            }
            
            if( $form->hide_time == '' ){
                $form->hide_time = $info->hide_time;
            }
            
            if( $form->model()->id == null ){
                $info = Coupon::where('id',$form->cid)->decrement('num', 1);
            }
        });


        return $form;
    }
}
