<?php

namespace App\Admin\Controllers\api;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Users;

class UsersController extends Controller
{
    
    public function userfind(Request $request)
    {   
        $q = $request->get('q');

        $data =  Users::where('openname', 'like', "%$q%")
                    ->orwhere('phone','like','%'.$q.'%')
                    ->paginate(null, ['id', 'openname as text']);
        
        return $data;
    }

}
