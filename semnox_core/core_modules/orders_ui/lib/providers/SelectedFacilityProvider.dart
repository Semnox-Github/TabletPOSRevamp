import 'package:flutter/material.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';

class SelectedFacility with ChangeNotifier{

  FacilityContainerDTO? facilityValue;
  FacilityContainerDTO? get selectedFacility => facilityValue;

  void updateFacility(FacilityContainerDTO? facilityContainerDTO){
    facilityValue = facilityContainerDTO;
    notifyListeners();
  }


}