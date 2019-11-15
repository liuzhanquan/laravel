<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GoodsSpecs extends Model
{
    //
    public function getall(){
        return $this->hasOne($this,'id','parent');
    }

    
}
