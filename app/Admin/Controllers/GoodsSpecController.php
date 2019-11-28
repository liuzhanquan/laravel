<?php

namespace App\Admin\Controllers;

use Encore\Admin\Facades\Admin;
use App\Http\Controllers\Controller;
use App\Models\GoodsSpecs;
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

class GoodsSpecController extends Controller
{
    use HasResourceActions;
    
    public function index(Content $content)
    {
        $content->header('规格属性');
        $content->description('列表');
        
        //$content->body(GoodsSpecs::tree());
        $content->body(GoodsSpecs::tree(function ($tree) {
                $tree->branch(function ($branch) {
                    $src = $branch['name'] ;
            
                    //return "{$branch['id']} -- $src -- {$branch['sort']} ";
                    return $src;
                });
            })
        );
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
        return Admin::grid(GoodsSpecs::class,function(Grid $grid){
            
            $grid->id('ID')->sortable();
            $grid->name('分类名');
            $grid->column('父类')->display(function(){

            });
            $grid->sort()->sortable();
            $grid->column('是否显示')->display(function($status){
                if( $status == 0 ){
                    return '隐藏';
                }else{
                    return '显示';
                }
            });
            $grid->created_at();
        });
    }
 

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new GoodsSpecs);

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
        $form->select('parent_id','上级')->options(GoodsSpecs::selectOptions());
        $form->text('name','标题');
        $form->text('sort','排序');
        $form->display('created_at', 'Created At');
        $form->display('updated_at', 'Updated at');
        return $form;
    }



}
