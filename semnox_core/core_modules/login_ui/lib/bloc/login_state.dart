import 'package:flutter/material.dart';
import 'package:login_data/models/login_response.dart';

@immutable
abstract class LoginState {}

class EmptyState extends LoginState {}

class SitesUpdatedState extends LoginState {}

class ErrorState extends LoginState {
  final String message;

  ErrorState(this.message);
}

class LoadingState extends LoginState {}

class SuccessState extends LoginState {
  final LoginResponse response;

  SuccessState(this.response);
}