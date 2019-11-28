<?php

namespace App\Admin\Controllers;

use App\Models\Order;
use App\Models\Users;
use App\Models\Goods;
use App\Models\Pay;
use App\Models\GoodsSon;
use App\Models\UserCoupon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\DB;
use Encore\Admin\Layout\Content;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Controllers\HasResourceActions;

class OrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '订单';

    //使用自带的显示，删除方法
    use HasResourceActions;

    public function index(Content $content)
    {
        $content->header('订单');
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
        $grid = new Grid(new Order);

        //$grid->disableCreateButton();

        $grid->column('id', __('Id'));
        $grid->column('order_num', __('订单号'));
        $grid->column('gid', __('商品信息'))->display(function ($id){
            $goods = Goods::find($id);
            return $goods->title;
        });
        $grid->column('sid', __('商品子信息'))->display(function ($id){
            $son = GoodsSon::find($id);
            return $son->type;
        });
        $grid->column('uid', __('用户信息'))->display(function ($id){
            $user = Users::find($id);
            return $user->openname;
        });
        $grid->column('price', __('支付金额'));
        $grid->column('odlprice', __('原金额'));
        $grid->column('pay', __('支付方式'))->display(function ($id) {
            $pay = Pay::find($id);
            return $pay->name;
        });
        $grid->column('ucid', '优惠券')->display(function ($id){
            if ($id) {
                $UC = new UserCoupon();
                $arr = $UC->getinfo($id);
                return $arr['text'];
            }
        });
        $grid->column('remark', __('用户备注'));
        $grid->column('addrlist', __('地址'))->display(function () {
            return $this->province.'-'.$this->city.'-'.$this->area.'-'.$this->addrlist;
        });
        $grid->column('show', __('是否显示'))->using(['0'=>'不显示','1'=>'显示']);
        $grid->column('comment', __('是否评论'))->using(['0'=>'未评论','1'=>'已评论']);
        $grid->column('socre', __('评分'));
        $grid->column('status', __('状态'))->display(function($status){
             switch($status){
                case 1:
                    $str = '未付款';
                    break;
                case 2:
                    $str = '已付款';
                    break;
                case 3:
                    $str = '已收货';
                    break;
                case 4:
                    $str = '未评价';
                    break; 
                case 5:
                    $str = '已评价';
                    break;   
                defalut:
                    $str = '未处理';
             }
             return $str;
        });
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('最近登录时间'));

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
        $show = new Show(Order::findOrFail($id));

        $show->panel()
                ->tools(function ($tools) {
            $tools->disableDelete();
        });

        $show->field('id', __('Id'));
        $show->field('order_num', __('订单号'));
        $show->field('gid', __('商品信息'))->as(function ($id){
            $goods = Goods::find($id);
            return $goods->title;
        });;
        $show->field('sid', __('商品子信息'))->as(function ($id){
            $son = GoodsSon::find($id);
            return $son->type;
        });
        $show->field('uid', __('用户信息'))->as(function ($id){
            $user = Users::find($id);
            return $user->openname;
        });
        $show->field('ucid', __('优惠券'))->as(function ($id){
            if ($id) {
                $UC = new UserCoupon();
                $arr = $UC->getinfo($id);
                return $arr['text'];
            }
        });
        $show->field('city', __('地址'))->as(function (){
            return $this->province.'-'.$this->city.'-'.$this->area;
        });
        $show->field('addrlist', __('详细地址'));
        $show->field('remark', __('备注'));
        $show->field('comment', __('是否评论'))->using(['0'=>'未评论','1'=>'已评论']);
        $show->field('socre', __('评分'));
        $show->field('status', __('状态'))->as(function($status){
            switch($status){
               case 1:
                   $str = '未付款';
                   break;
               case 2:
                   $str = '已付款';
                   break;
               case 3:
                   $str = '已收货';
                   break;
               case 4:
                   $str = '未评价';
                   break; 
               case 5:
                   $str = '已评价';
                   break;   
               defalut:
                   $str = '未处理';
            }
            return $str;
       });;
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
        $form = new Form(new Order);
        
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
        $form->display('order_num','订单号');
        //商品id查询
        $form->select('gid', '商品ID')->options(function ($id) {
            $goods = Goods::find($id);
            if( $goods ){
                return [ $goods->id => $goods->title ];
            }
        })->ajax('/admin/api/goodsfind')->load('sid', '/admin/api/goodssonfind');
        
        $form->select('sid', '商品子ID')->options(function ($id) {
            $goodsson = GoodsSon::find($id);
            if( $goodsson ){
                return [ $goodsson->id => $goodsson->type ];
            }
        });
        //用户id查询
        $form->select('uid','用户')->options(function ($id) {
            $user = Users::find($id);
            
            if ($user) {
                return [$user->id => $user->openname];
            }
        })->ajax('/admin/api/userfind')->load('ucid', '/admin/api/usercouponSel');


        $form->select('ucid', '优惠券ID')->options(function ($id){
            if ($id) {
                $UC = new UserCoupon();
                $arr = $UC->getinfo($id);
                return [$arr['id']=>$arr['text']];
            }
        });
        $form->number('num', '购买数量');
        $form->number('price', '支付金额')->rules('required',['required'=>'支付金额不能为空']);
        $form->number('oldprice', '原金额(无优惠)');
        $form->textarea('remark','用户备注');
        $form->distpicker(['province_id', 'city_id', 'area_id']);
        $form->text('addrlist','地址');
        $form->select('pay','支付方式')->options(function($id){
            
            $pay = Pay::get();
            $arr = ['0'=>'未支付'];
            foreach( $pay as $key=>$item ){
                $arr[$key+1] = $item->name; 
            }
            return $arr;
        });
        $form->radio('show','是否显示')->options(['0' => '不显示', '1'=> '显示'])->default('1');
        $form->radio('status','状态')->options(['0' => '冻结', '1'=> '启用'])->default('1');
        $form->radio('comment','评论状态')->options(['0' => '未评论', '1'=> '已评论'])->default('0');
        $form->number('socre', '评分');
        $form->display('created_at','创建时间');
        $form->display('updated_at','最近登录时间');

        $form->hidden('province');
        $form->hidden('city');
        $form->hidden('area');
        $form->hidden('order_num');

        $form->saving(function (Form $form) {
            $form->province = DB::table('china_area')->where('code',$form->province_id)->value('name');
            $form->city = DB::table('china_area')->where('code',$form->city_id)->value('name');
            $form->area = DB::table('china_area')->where('code',$form->area_id)->value('name');
            if ( $form->model()->order_num == null  ) {
                $form->order_num = orderNumCreate();
            }
            
        });


        return $form;
    }
}
