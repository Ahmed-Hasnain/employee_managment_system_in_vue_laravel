@extends('layouts.main')
@section('page_title','List Of Departments')
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
        <form method="GET" action="{{ route('departments.index') }}">
            <div class="form-row float-left">
              <div class="col-auto">
                <label class="sr-only" for="inlineFormInput">Name</label>
                <input type="search" name="search" class="form-control mb-2" id="inlineFormInput" placeholder="Search departments by Department name">
              </div>
              
              <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-2">Submit</button>
              </div>
            </div>
          </form>
        <a href="{{ route('departments.create') }}" class="btn btn-primary float-right">Create Department</a>
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Manage</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($departments as $department)
            <tr>
                <th scope="row">{{ $department->id }}</th>
                <td>{{ $department->name }}</td>
                <td>
                    <a href="{{ route('departments.edit', $department->id) }}" class="btn btn-primary mr-2">
                        Edit
                    </a>
                    <span class="">
                        <form action="{{ route('departments.destroy',$department->id) }}" method="POST" class="float-right">
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
