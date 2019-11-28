<?php

namespace App\Admin\Controllers;

use App\Models\Coupon;
use App\Models\Agent;
use App\Models\Goods;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Layout\Content;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Controllers\HasResourceActions;
use App\Admin\Actions\Post\DelStatus;

class CouponController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'App\Coupon';

    //使用自带的显示，删除方法
    use HasResourceActions;

    public function index(Content $content)
    {
        $content->header('优惠券');
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
        $grid = new Grid(new Coupon);

        //$grid->disableCreateButton();
        $grid->model()->where('status', '>=', 0);
        $grid->column('id', __('Id'));
        $grid->column('gid', __('商品ID'));
        $grid->column('aid', __('代理商ID'));
        $grid->column('price', __('金额'));
        $grid->column('num', __('数量'));
        $grid->column('level', __('作用范围'))->using(['0'=>'所有商品','1'=>'代理商商品','2'=>'当前商品']);
        $grid->column('remark', __('备注'));
        $grid->column('type', __('卡片类型'))->using(['0'=>'实体卡','1'=>'虚拟卡']);
        $grid->column('print', __('是否打印'))->using(['0'=>'未打印','1'=>'已打印']);
        $grid->column('show_time', __('开始使用'));
        $grid->column('hide_time', __('结束使用'));
        $grid->column('status', __('状态'))->display(function($status){
             if( $status == 1 ){
                $str = '未启用';
             }else if( $status == 2 ){
                $str = '启用';
             }else{
                $str = '已删除';
             }
             return $str;
        });
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('最近登录时间'));

        $grid->actions(function ($actions) {
            // 去掉删除
            $actions->disableDelete();
            // 添加自定义删除按钮
            $actions->add(new DelStatus);
        });

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            // 在这里添加字段过滤器
            $filter->column(1/2, function ($filter) {
                //关联代理商
                $filter->where(function ($query) {
                    $query->whereHas('agent', function ($query) {
                        $query->where('name', 'like', "%{$this->input}%");
                    });
                }, '代理商名称');
                //关联商品表
                $filter->where(function ($query) {
                    $query->whereHas('goods', function ($query) {
                        $query->where('name', 'like', "%{$this->input}%");
                    });
                }, '商品标题');
            });
        
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
        $show = new Show(Coupon::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('gid', __('商品信息'))->as(function ($id){
            $list = Goods::find($id);
            if ( $list ) {
                return $list->title;
            }
        });
        $show->field('aid', __('代理商信息'))->as(function ($id){
            $list = Agent::find($id);
            if ( $list ) {
                return $list->name;
            }
        });
        $show->field('price', __('金额'));
        $show->field('num', __('数量'));
        $show->field('level', __('作用范围'))->using(['0' => '全部订单', '1'=> '代理商商品','2'=>'当前商品']);
        $show->field('status', __('状态'))->using(['1' => '未使用', '2'=> '已使用']);
        $show->field('type', __('卡片类型'))->using(['0'=>'实体卡','1'=>'虚拟卡']);
        $show->field('print', __('是否打印'))->using(['0' => '未打印', '1'=> '已打印']);
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('最近登录时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Coupon);
        
        $form->tools(function (Form\Tools $tools) {
            // 去掉`列表`按钮
            //$tools->disableList();
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
        //商品id查询
        $form->select('gid', '商品ID')->options(function ($id) {
            $goods = Coupon::find($id);
            if( $goods ){
                return [ $goods->id => $goods->title ];
            }
        })->ajax('/admin/api/goodsfind')->load('sid', '/admin/api/goodssonfind');

        $form->select('aid', '代理商')->options(function ($id){
          $list = Agent::find($id);
          if ( $list ) {
              return [ $list->id => $list->name ];
          }
        })->ajax('/admin/api/agentfind');
        $form->number('price', '金额');
        $form->number('num', '可领取数量');
        $form->radio('level','作用范围')->options(['0' => '全部订单', '1'=> '代理商商品','2'=>'当前商品'])->default('0');
        $form->radio('status','状态')->options(['1' => '未使用', '2'=> '已使用'])->default('1');
        $form->radio('type','卡片类型')->options(['0' => '实体卡', '1'=> '虚拟卡'])->default('1');
        $form->text('remark','备注');
        $form->dateRange('show_time', 'hide_time', '使用时间');
        $form->display('created_at','创建时间');
        $form->display('updated_at','最近登录时间');

        $form->saving(function (Form $form) {
            
        });


        return $form;
    }
}
