@extends('layouts.main')
@section('page_title','List Of Users')
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
        <form method="GET" action="{{ route('user.index') }}">
            <div class="form-row float-left">
              <div class="col-auto">
                <label class="sr-only" for="inlineFormInput">Name</label>
                <input type="search" name="search" class="form-control mb-2" id="inlineFormInput" placeholder="Search user by username">
              </div>
              
              <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-2">Submit</button>
              </div>
            </div>
          </form>
        <a href="{{ route('user.create') }}" class="btn btn-primary float-right">Create User</a>
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Username</th>
                <th scope="col">Email</th>
                <th scope="col">Manage</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($users as $user)
            <tr>
                <th scope="row">{{ $user->id }}</th>
                <td>{{ $user->username }}</td>
                <td>{{ $user->email }}</td>
                <td>
                    <a href="{{ route('user.edit', $user->id) }}" class="btn btn-primary       mr-2">
                        Edit
                    </a>
                    <span class="">
                        <form action="{{ route('user.destroy',$user->id) }}" method="POST" class="float-right">
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
