import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/sites/site_dto.dart';
import 'package:semnox_tablet_pos/cubits/pos_config/pos_config_cubit.dart';
import 'package:system_user_login_data/models/system_user_login_response.dart';

part 'pos_config_state.freezed.dart';
part 'pos_config_state.g.dart';

@freezed
class PosConfigState with _$PosConfigState {
  const factory PosConfigState({
    @Default(-1) int loadingStatus,
    @Default(false) bool isServerValidated,
    @Default([]) List<SiteDTO> sites,
    @Default(false) bool isServerErrorsPresent,
    SystemUserLoginResponse? loginResponse,
    String? loadingMessage,
    String? validationError,
    String? apiError,
  }) = _PosConfigState;

  factory PosConfigState.fromJson(Map<String, dynamic> json) => _$PosConfigStateFromJson(json);
}