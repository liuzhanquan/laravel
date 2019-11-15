<?php

namespace App\Admin\Controllers;


use Encore\Admin\Grid;
use Encore\Admin\Form;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use App\Models\Goods;

class GoodsController extends Controller
{
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('header');
            $content->description('description');

            // $content->body($this->filter());
            $content->body($this->grid());
        });
    }

    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('header');
            $content->description('description');

            // $content->body($this->filter());
            $content->body($this->form());
        });
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

            $grid->title();
            $grid->title_list();
            $grid->column('photo')->display(function ($photo) {
                return "<img src='$photo' />";
            });
            $grid->filter(function($filter){
                $filter->equal('id', '2');
            });
        });
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Goods::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->text('title','标题');
            $form->text('title_list','副标题');
            $form->text('title','标题');
            $form->display('created_at', 'Created At');
            $form->display('updated_at', 'Updated At');
        });
    }


}
