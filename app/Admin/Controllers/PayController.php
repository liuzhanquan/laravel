<?php

namespace App\Admin\Controllers;

use Encore\Admin\Facades\Admin;
use App\Http\Controllers\Controller;
use App\Models\Pay;
use Encore\Admin\Tree;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Layout\Content;
use App\Models\Movie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;
use Encore\Admin\Controllers\HasResourceActions;

class PayController extends Controller
{
    use HasResourceActions;
    
    public function index(Content $content)
    {
        $content->header('规格属性');
        $content->description('列表');
        
        //$content->body(GoodsSpecs::tree());
        $content->body($this->grid());
        return $content;

    }

    public function create()
    {
        return Admin::content(function (Content $content){
            $content->header('header');
            $content->description('description');

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
    
    
    /**
     * Make a grid builder.
     *
     * @return Grid
     */

    public function grid(){
        return Admin::grid(Pay::class,function(Grid $grid){
            $grid->model()->orderBy('sort','Desc');
            $grid->id('ID')->sortable();
            $grid->name('支付类型');
            $grid->photo('图片')->image();
            $grid->sort()->sortable();
            $grid->status('是否启用')->display(function($status){
                if( $status == 0 ){
                    return '未启用';
                }else{
                    return '启用';
                }
            });
            $grid->created_at('添加时间');
            $grid->updated_at('更新时间');
        });
    }
 

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Pay);

        $form->tools(function (Form\Tools $tools) {
            //$tools->disableView();
            //$tools->disableDelete();
        });

        $form->footer(function (Form\Footer $footer) {
            $footer->disableReset();
            $footer->disableEditingCheck();
            //$footer->disableCreatingCheck();
            $footer->disableViewCheck();
        });

        $form->display('id', 'ID');
        $form->text('name','支付名称');
        $form->image('photo','图片');
        $form->number('sort','排序');
        $form->text('remark','备注');
        $form->radio('status', '是否启用')->options(['0' => '不启用', '1'=> '启用'])->default('1');
        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated at');
        return $form;
    }



}
