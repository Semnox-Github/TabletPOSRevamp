class FacilityModel {
  final int facilityId;
  final String facilityName;
  final String description;
  final String activeFlag;
  final bool allowMultipleBookings;
  final int capacity;
  final String internetKey;
  final String guid;
  final String screenPosition;
  final int facilityType;
  final String maxRowIndex;
  final String maxColIndex;
  final int interfaceType;
  final int interfaceName;
  List facilityTableContainerDTOList;

  FacilityModel({
    required this.facilityId,
    required this.facilityName,
    required this.description,
    required this.activeFlag,
    required this.allowMultipleBookings,
    required this.capacity,
    required this.internetKey,
    required this.guid,
    required this.screenPosition,
    required this.facilityType,
    required this.maxRowIndex,
    required this.maxColIndex,
    required this.interfaceType,
    required this.interfaceName,
    required this.facilityTableContainerDTOList,
  });

  factory FacilityModel.fromJson(Map<String, dynamic> json){
    return FacilityModel(
        facilityId: json['FacilityId'] ?? 0,
        facilityName: json['FacilityName'] ?? '',
        description: json['Description'] ?? '',
        activeFlag: json['Description'] ?? '',
        allowMultipleBookings: json['AllowMultipleBookings'] ?? false,
        capacity: json['Capacity'] ?? 0,
        internetKey: json['InternetKey'] ?? '',
        guid: json['Guid'] ?? '',
        screenPosition: json['ScreenPosition'] ?? '',
        facilityType: json['FacilityType'] ?? 0,
        maxRowIndex: json['MaxRowIndex'] ?? '',
        maxColIndex: json['MaxColIndex'] ?? '',
        interfaceType: json['InterfaceType'] ?? 0,
        interfaceName: json['InterfaceName'] ?? 0,
        facilityTableContainerDTOList: json['FacilityTableContainerDTOList'] ?? [],
    );
  }
}