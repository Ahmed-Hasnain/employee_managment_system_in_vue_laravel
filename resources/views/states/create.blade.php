@extends('layouts.main')
@section('page_title','Create State')
@section('content')

<div class="card">
    <div class="card-header">
        {{ __('Create') }}
        <a href="{{ route('states.index') }}" class="float-right btn btn-primary">Back To States List</a>
    </div>

    <div class="card-body">
        <form method="POST" action="{{ route('states.store') }}">
            @csrf

            <div class="row mb-3">
                <label for="country" class="col-md-4 col-form-label text-md-right">{{ __('Select Country') }}</label>

                <div class="col-md-6">
                   
                    <select class="form-control" id="inputGroupSelect01" name="country_id">
                        <option selected>Select Country</option>
                        @foreach ($countries as $country)
                        <option value="{{ $country->id }}">{{ $country->name }}</option>
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
