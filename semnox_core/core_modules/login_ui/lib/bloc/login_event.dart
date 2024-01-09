import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent {}

class LoginClickEvent extends LoginEvent {}

class ManagerLoginClickEvent extends LoginEvent {}

class ManagerLoginTapCardEvent extends LoginEvent {}

class ClearErrorEvent extends LoginEvent {}

class ClearAllStateEvent extends LoginEvent {}

class AddErrorEvent extends LoginEvent {}

class RequestSitesEvent extends LoginEvent {}

class LoginViaCardEvent extends LoginEvent {}

class AuthenticateEvent extends LoginEvent {}
