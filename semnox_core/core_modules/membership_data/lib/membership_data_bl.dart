import 'package:membership_data/membership_data_service.dart';
import 'package:membership_data/models/membership_response.dart';

abstract class MembershipDataBLContract {
  Future<MemberShipResponse> callMembershipDataApi();
  MemberShipResponse? getMembershipData();
  void clear();
}

class MembershipDataBLImpl implements MembershipDataBLContract {

  final MembershipDataService _membershipDataService;

  MembershipDataBLImpl(this._membershipDataService);

  @override
  Future<MemberShipResponse> callMembershipDataApi() {
    return _membershipDataService.callMembershipDataApi();
  }

  @override
  MemberShipResponse? getMembershipData() {
    return _membershipDataService.getMembershipData();
  }

  @override
  void clear() {
    _membershipDataService.clear();
  }
}
