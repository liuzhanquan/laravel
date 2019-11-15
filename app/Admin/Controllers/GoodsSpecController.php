<?php

namespace App\Admin\Controllers;

use Encore\Admin\Grid;
use Encore\Admin\Form;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use App\Models\GoodsSpecs;

class GoodsSpecController extends Controller
{
    public function index()
    {
        return Admin::content(function (Content $content){
            $content->header('header');
            $content->description('description');

            $content->body($this->grid());
        });


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
     * Make a grid builder.
     *
     * @return Grid
     */

    public function grid(){
        return Admin::grid(GoodsSpecs::class,function(Grid $grid){
            
            $grid->id('ID')->sortable();
            $grid->name('分类名');
            $grid->column('getall.name','父类');
            $grid->sort()->sortable();
            $grid->column('status')->display(function($status){
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
        return Admin::form(GoodsSpecs::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->model()->getall();
            $form->text('title_list','副标题');
            $form->text('title','标题');
            $form->display('created_at', 'Created At');
            $form->display('updated_at', 'Updated At');
        });
    }







}
