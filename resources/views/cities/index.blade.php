@extends('layouts.main')
@section('page_title','List Of Cities')
@section('content')

<div class="card">
    <div>
        @if (session()->has('message'))
            <div class="alert alert-success">
                {{ session('message') }}
            </div>
        @endif
    </div>
    <div class="card-header">
        <form method="GET" action="{{ route('cities.index') }}">
            <div class="form-row float-left">
              <div class="col-auto">
                <label class="sr-only" for="inlineFormInput">Name</label>
                <input type="search" name="search" class="form-control mb-2" id="inlineFormInput" placeholder="Search cities by city name">
              </div>
              
              <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-2">Submit</button>
              </div>
            </div>
          </form>
        <a href="{{ route('cities.create') }}" class="btn btn-primary float-right">Create city</a>
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">State Name</th>
                <th scope="col">Country Name</th>
                <th scope="col">Manage</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($cities as $city)
            <tr>
                <th scope="row">{{ $city->id }}</th>
                <td>{{ $city->name }}</td>
                <td>{{ $city->state->name }}</td>
                <td>{{ $city->state->country->name }}</td>
                <td>
                    <a href="{{ route('cities.edit', $city->id) }}" class="btn btn-primary mr-2">
                        Edit
                    </a>
                    <span class="">
                        <form action="{{ route('cities.destroy',$city->id) }}" method="POST" class="float-right">
                            @csrf
                            @method('DELETE')
                            <button class="btn btn-danger ">Delete </button>
                        </form>
                    </span>
                    
                </td>
            </tr>
            @endforeach
            </tbody>
        </table>
    </div>
    
</div>
        
@endsection
