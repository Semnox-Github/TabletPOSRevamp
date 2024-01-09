
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/user_container/user_container_dto.dart';

part 'user_container_data.freezed.dart';
part 'user_container_data.g.dart';

@freezed
class UserContainerData with _$UserContainerData{
  const factory UserContainerData({
    @JsonKey(name: 'UserContainerDTOList')
    required List<UserContainerDTO> userContainerDTOList,
    String? hash,
  }) =_UserContainerData;

  factory UserContainerData.fromJson(Map<String, dynamic> json) => _$UserContainerDataFromJson(json);

}