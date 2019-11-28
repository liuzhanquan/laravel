<?php

namespace App\Admin\Controllers\api;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Pay;

class PayController extends Controller
{
    
    public function payAll(Request $request)
    {   
        
        return Pay::where('status', '=', "1")->paginate(null, ['id', 'name as text']);
    }



}
