import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FacilityEvent extends  Equatable{
  const FacilityEvent();
}

//data loading state
class LoadFacilityEvent extends FacilityEvent{
  @override
  List<Object> get props => [];
}

/*
//data loaded state
class LoadedFacilityEvent extends FacilityEvent{
  @override
  List<Object?> get props => [];
}

//data loading error state
class ErrorLoadingFacilityEvent  extends FacilityEvent{
  @override
  List<Object?> get props => [];
}
*/