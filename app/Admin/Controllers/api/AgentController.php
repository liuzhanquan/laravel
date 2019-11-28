<?php

namespace App\Admin\Controllers\api;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Agent;

class AgentController extends Controller
{
    
    public function agentfind(Request $request)
    {   
        $q = $request->get('q');

        $data =  Agent::leftjoin('users','users.id','=','agent.uid')
                    ->where('users.openname', 'like', "%$q%")
                    ->orwhere('agent.name','like',"%$q%")
                    ->paginate(null, ['agent.id', 'agent.name as text']);
        
        return $data;
    }

}
