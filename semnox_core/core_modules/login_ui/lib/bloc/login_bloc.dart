import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_data/login_bl.dart';
import 'package:login_data/models/login_request.dart';
import 'package:login_ui/bloc/login_event.dart';
import 'package:login_ui/bloc/login_state.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:master_data/models/sites/site_response.dart';
import 'package:messages_data/builder.dart';
import 'package:system_user_login_data/models/system_user_login_response.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late MasterDataBLContract masterDataBL;
  late LoginBLContract loginBL;
  late LoginRequest loginRequest;

  SystemUserLoginResponse? systemUserLoginResponse;
  SiteResponse? siteResponse;
  String? error;

  LoginBloc() : super(EmptyState()) {
    on<RequestSitesEvent>(_onGetSites);
    on<LoginClickEvent>(_onLoginClick);
    on<ManagerLoginClickEvent>(_onManagerLoginClick);
    on<ClearErrorEvent>(_clearErrorMessage);
    on<ClearAllStateEvent>(_clearAllStates);
    on<AddErrorEvent>(_addErrorMessage);
    on<LoginViaCardEvent>(_loginViaCard);
    on<AuthenticateEvent>(_authenticateUser);
  }

  void _onGetSites(RequestSitesEvent event, Emitter<LoginState> emit) async {
    siteResponse = await masterDataBL.getSites();
    if (siteResponse != null) {
      emit(SitesUpdatedState());
    }
  }

  void _onLoginClick(LoginClickEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    try {
      final response = await loginBL.login(loginRequest);
      if (response.exception == null) {
        emit(SuccessState(response));
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      switch (error.type) {
        case DioErrorType.cancel:
          errorString = "Request cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.receiveTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.response:
          errorString = error.response?.data['data'] as String?;
          break;
        case DioErrorType.sendTimeout:
          errorString = "Connection time out";
          break;
        default:
          errorString = "Please check your connection";
          break;
      }
      emit(ErrorState(errorString ?? ''));
    }
  }

  void _onManagerLoginClick(
      ManagerLoginClickEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    try {
      final response = await loginBL.managerLogin(loginRequest);
      if (response.exception == null) {
        emit(SuccessState(response));
      }
    } on DioError catch (error) {
      final errorString = error.response?.data['data'] as String?;
      if (error.response?.statusCode == 401) {
        emit(ErrorState(
            "${MessagesProvider.get("Session Expired")}. ${MessagesProvider.get("Please re-login")}"));
      } else {
        emit(ErrorState(errorString ?? ''));
      }
    }
  }

  void _loginViaCard(LoginViaCardEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    try {
      final response = await loginBL.login(loginRequest);
      if (response.exception == null) {
        emit(SuccessState(response));
      }
    } on DioError catch (error) {
      final errorString = error.response?.data['data'] as String?;
      emit(ErrorState(errorString ?? ''));
    }
  }

  void _clearErrorMessage(ClearErrorEvent event, Emitter<LoginState> emit) {
    emit(ErrorState(''));
    error = null;
  }

  void _addErrorMessage(AddErrorEvent event, Emitter<LoginState> emit) {
    emit(ErrorState(error ?? ''));
  }

  void setError(String message) {
    error = message;
  }

  void setLoginRequest(LoginRequest request) {
    loginRequest = request;
  }

  void setMasterDataBL(MasterDataBLContract masterDataBLContract) {
    masterDataBL = masterDataBLContract;
  }

  void setSystemUserLoginResponse(SystemUserLoginResponse response) {
    systemUserLoginResponse = response;
  }

  void setLoginBL(LoginBLContract loginBLContract) {
    loginBL = loginBLContract;
  }

  FutureOr<void> _authenticateUser(
      AuthenticateEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    try {
      final response = await loginBL.authenticateUser(loginRequest);
      if (response.exception == null) {
        emit(SuccessState(response));
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      switch (error.type) {
        case DioErrorType.cancel:
          errorString = "Request cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.receiveTimeout:
          errorString = "Connection time out";
          break;
        case DioErrorType.response:
          errorString = error.response?.data['data'] as String?;
          break;
        case DioErrorType.sendTimeout:
          errorString = "Connection time out";
          break;
        default:
          errorString = "Please check your connection";
          break;
      }
      emit(ErrorState(errorString ?? ''));
    }
  }

  void _clearAllStates(ClearAllStateEvent event, Emitter<LoginState> emit) {
    error = null;
    emit(EmptyState());
  }
}
