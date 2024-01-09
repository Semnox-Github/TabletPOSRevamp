import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/facility_model.dart';

@immutable
abstract class FacilityState extends  Equatable{}

//data loading state
class FacilityLoadingState extends FacilityState{
  @override
  List<Object> get props => [];
}

class FacilityLoadedState extends FacilityState{
  FacilityLoadedState(this.facilities);
  final List<FacilityContainerDTO> facilities;
  @override
  List<Object?> get props => [facilities];
}

class FacilityLoadingErrorState extends FacilityState{
  FacilityLoadingErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}

/*
//data loaded state
class FacilityLoadedState extends FacilityState{
  @override
  List<Object?> get props => [];
}

//data loading error state
class FacilityLoadingErrorState extends FacilityState{
  @override
  List<Object?> get props => [];
}
*/