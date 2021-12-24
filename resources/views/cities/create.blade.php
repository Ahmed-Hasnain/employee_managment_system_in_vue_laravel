@extends('layouts.main')
@section('page_title','Create City')
@section('content')

<div class="card">
    <div class="card-header">
        {{ __('Create') }}
        <a href="{{ route('cities.index') }}" class="float-right btn btn-primary">Back To cities List</a>
    </div>

    <div class="card-body">
        <form method="POST" action="{{ route('cities.store') }}">
            @csrf

            <div class="row mb-3">
                <label for="country" class="col-md-4 col-form-label text-md-right">{{ __('Select State') }}</label>

                <div class="col-md-6">
                   
                    <select class="form-control" id="state_select" name="state_id" required >
                        <option selected>Select State</option>
                        @foreach ($states as $state)
                        <option value="{{ $state->id }}">{{ $state->name }}</option>
                        @endforeach
                        
                        
                    </select>

                   
                </div>
            </div>

            

            <div class="row mb-3">
                <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>

                <div class="col-md-6">
                    <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                    @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
            </div>

            <div class="row mb-0">
                <div class="col-md-6 offset-md-4">
                    <button type="submit" class="btn btn-primary">
                        {{ __('Store') }}
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
        
@endsection
