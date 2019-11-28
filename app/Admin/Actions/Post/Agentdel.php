<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Agentdel extends RowAction
{
    public $name = '删除';

    public function handle(Model $model)
    {
        // $model ...
        
        $model->where('id',$this->getkey())->update(['status'=>'-1']);
        return $this->response()->success('Success message.')->refresh();
    }

}