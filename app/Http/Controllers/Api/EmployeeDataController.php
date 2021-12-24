<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\City;
use App\Models\State;
use App\Models\Country;
use App\Models\Department;

class EmployeeDataController extends Controller
{
    public function countries()
    {
        $countries = Country::all();
        
        if ($countries) {
            return response()->json([
                'status'=> 200,
                'message'=> 'Countries Found',
                'countries'=> $countries,
            ]);
        }
        else{
            return response()->json([
                'status'=> 500,
                'message'=> 'Countries Not Found',
            ]);
        }
    }

    public function states(Country $country)
    {
        
        if ($country->states) {
            return response()->json([
                'status'=> 200,
                'message'=> 'States Found',
                'states'=> $country->states,
            ]);
        }
        else{
            return response()->json([
                'status'=> 500,
                'message'=> 'States Not Found',
            ]);
        }
    }

    public function cities(State $state)
    {
        
        if ($state->cities) {
            return response()->json([
                'status'=> 200,
                'message'=> 'Cities Found',
                'cities'=> $state->cities,
            ]);
        }
        else{
            return response()->json([
                'status'=> 500,
                'message'=> 'Cities Not Found',
            ]);
        }
    }

    public function departments()
    {
        $departments = Department::all();
        if ($departments) {
            return response()->json([
                'status'=> 200,
                'message'=> 'Departments Found',
                'departments'=> $departments,
            ]);
        }
        else{
            return response()->json([
                'status'=> 500,
                'message'=> 'Departments Not Found',
            ]);
        }
    }
   
}
