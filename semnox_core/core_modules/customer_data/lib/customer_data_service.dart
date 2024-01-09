import 'package:customer_data/api_client/customer_data_api_client.dart';
import 'package:customer_data/constants.dart' as constants;
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/account_details/summaries_counts_response.dart';
import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/card_serial_numbers/card_serial_numbers_response.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:customer_data/models/customer_response.dart';
import 'package:customer_data/models/customer_search/customer_search_response.dart';
import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_response.dart';
import 'package:customer_data/models/profile_dto.dart';
import 'package:customer_data/models/request/customer_register/customer_register_request.dart';
import 'package:customer_data/models/request/customer_search/customer_search_condition.dart';
import 'package:customer_data/models/search_count/customer_search_count_response.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/models/execution_context_dto.dart';

import 'models/account_details/account_details_data.dart';
import 'models/account_details/link_account_details_response.dart';
import 'models/account_details/purchase_response.dart';
import 'models/account_details/summaries_response.dart';
import 'models/card_serial_numbers/serial_number_data.dart';
import 'models/country_container/country_container_response.dart';
import 'models/membership_summary/membership_summary_response.dart';
import 'models/relationships/customer_relationship_data.dart';
import 'models/relationships/customer_relationship_response.dart';
import 'models/relationships/update_relationship_request.dart';

class CustomerDataService {
  late CustomerDataApiClient _customerDataApiClient;
  late ExecutionContextDTO _executionContextDTO;

  static final CustomerDataService _instance = CustomerDataService._internal();
  CustomerDataService._internal();

  factory CustomerDataService(CustomerDataApiClient apiClient,
      ExecutionContextDTO executionContextDTO) {
    _instance._customerDataApiClient = apiClient;
    _instance._executionContextDTO = executionContextDTO;
    return _instance;
  }

  CustomerSearchCountResponse? _customerSearchCountResponse;
  final _basicSearchConditions = <CustomerSearchCondition>[];
  LoyaltyAttributeContainerResponse? _loyaltyAttributeContainerResponse;
  CountryContainerResponse? _countryContainerResponse;
  MembershipSummaryResponse? _membershipSummaryResponse;

  Future<CustomerSearchResponse> searchCustomerBasic(
      {int currentPage = 0,
      int pageSize = 20,
      bool isAscending = false,
      String? firstName,
      String? middleName,
      String? lastName,
      String? uniqueId,
      String? phoneNo,
      bool? isExactPhoneNeeded,
      String? email,
      bool? isExactEmailNeeded,
      String? siteId,
      String? memberShipId}) async {
    _basicSearchConditions.clear();
    if (firstName != null && firstName.isNotEmpty) {
      _basicSearchConditions.add(CustomerSearchCondition(
        Criteria: constants.AND,
        Operator: constants.LIKE,
        Column: constants.PROFILE_FIRST_NAME,
        Parameter: firstName,
        SortByColumn: '',
      ));
    }
    if (middleName != null && middleName.isNotEmpty) {
      _basicSearchConditions.add(CustomerSearchCondition(
        Criteria: constants.AND,
        Operator: constants.LIKE,
        Column: constants.PROFILE_MIDDLE_NAME,
        Parameter: middleName,
        SortByColumn: '',
      ));
    }
    if (lastName != null && lastName.isNotEmpty) {
      _basicSearchConditions.add(CustomerSearchCondition(
        Criteria: constants.AND,
        Operator: constants.LIKE,
        Column: constants.PROFILE_LAST_NAME,
        Parameter: lastName,
        SortByColumn: '',
      ));
    }
    if (uniqueId != null && uniqueId.isNotEmpty) {
      _basicSearchConditions.add(CustomerSearchCondition(
        Criteria: constants.AND,
        Operator: constants.LIKE,
        Column: constants.PROFILE_UNIQUE_IDENTIFIER,
        Parameter: uniqueId,
        SortByColumn: '',
      ));
    }
    if (phoneNo != null && phoneNo.isNotEmpty) {
      _basicSearchConditions.add(CustomerSearchCondition(
        Criteria: constants.AND,
        Operator:
            isExactPhoneNeeded == true ? constants.EQUAL_TO : constants.LIKE,
        Column: constants.PHONE_NO,
        Parameter: phoneNo,
        SortByColumn: '',
      ));
    }
    if (email != null && email.isNotEmpty) {
      _basicSearchConditions.add(CustomerSearchCondition(
        Criteria: constants.AND,
        Operator:
            isExactEmailNeeded == true ? constants.EQUAL_TO : constants.LIKE,
        Column: constants.EMAIL,
        Parameter: email,
        SortByColumn: '',
      ));
    }
    if (siteId != null && siteId.isNotEmpty) {
      _basicSearchConditions.add(CustomerSearchCondition(
        Criteria: constants.AND,
        Operator: constants.EQUAL_TO,
        Column: constants.CUSTOMER_SITE_ID,
        Parameter: siteId,
        SortByColumn: '',
      ));
    }
    if (memberShipId != null && memberShipId.isNotEmpty) {
      _basicSearchConditions.add(CustomerSearchCondition(
        Criteria: constants.AND,
        Operator: constants.EQUAL_TO,
        Column: constants.CUSTOMER_MEMBERSHIP_ID,
        Parameter: memberShipId,
        SortByColumn: '',
      ));
    }
    try {
      _customerSearchCountResponse = await _customerDataApiClient
          .getCustomerSearchCount(
              {'currentPage': currentPage, 'pageSize': pageSize},
              _basicSearchConditions);

      return _customerDataApiClient.searchCustomers({
        'currentPage': currentPage,
        'pageSize': pageSize,
        'isAscending': isAscending
      }, _basicSearchConditions);
    } on DioError {
      rethrow;
    }
  }

  int? getTotalCustomers() {
    return _customerSearchCountResponse?.data;
  }

  int? getTotalPages() {
    return _customerSearchCountResponse?.totalNoOfPages;
  }

  Future<CustomerSearchResponse> searchCustomerAdvanced(
      {int currentPage = 0,
      int pageSize = 20,
      bool isAscending = false,
      required List<CustomerSearchCondition> conditionsList}) async {
    try {
      _customerSearchCountResponse = await _customerDataApiClient
          .getCustomerSearchCount(
              {'currentPage': currentPage, 'pageSize': pageSize},
              conditionsList);

      return _customerDataApiClient.searchCustomers({
        'currentPage': currentPage,
        'pageSize': pageSize,
        'isAscending': isAscending
      }, conditionsList);
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerResponse> registerCustomer(
      {required String title,
      required String firstName,
      String? middleName,
      String? lastName,
      String? dob,
      String? idProofUrl,
      String? nickName,
      String? gender,
      String? anniversary,
      String? uniqueIdentifier,
      bool? rightHanded,
      bool? teamUser,
      String? company,
      String? designation,
      String? taxCode,
      String? notes,
      String? externalSystemReference,
      String? channel,
      String? type,
      String? userName,
      String? membership,
      bool? verified,
      required bool policyTermsAccepted,
      required List<ContactDTO> contactList,
      required List<AddressDTO> addressList}) async {
    try {
      final profileDTO = ProfileDTO(
          id: -1,
          profileTypeId: -1,
          profileType: -1,
          title: title,
          firstName: firstName,
          nickName: nickName,
          middleName: middleName ?? '',
          lastName: lastName ?? '',
          dateOfBirth: dob,
          notes: notes,
          externalSystemReference: "",
          gender: gender ?? 'N',
          anniversary: anniversary,
          photoURL: '',
          rightHanded: rightHanded ?? false,
          teamUser: teamUser ?? false,
          uniqueIdentifier: uniqueIdentifier,
          idProofFileURL: idProofUrl ?? '',
          taxCode: taxCode,
          designation: designation,
          company: company,
          userName: userName,
          password: '',
          contactDTOList: contactList,
          addressDTOList: addressList,
          profileContentHistoryDTOList: null,
          optInPromotions: false,
          optInPromotionsMode: '',
          policyTermsAccepted: policyTermsAccepted,
          isActive: true,
          createdBy: '',
          creationDate: '',
          lastUpdatedBy: '',
          lastUpdateDate: '',
          siteId: -1,
          masterEntityId: -1,
          synchStatus: false,
          guid: '',
          channel: "",
          verified: verified ?? false,
          optOutWhatsApp: false,
          userStatus: '',
          invalidAccessAttempts: 0,
          passwordChangeOnNextLogin: false,
          isChanged: false,
          isChangedRecursive: false);

      final registerRequest = CustomerRegisterRequest(
          id: -1,
          profileId: -1,
          membershipId: -1,
          masterEntityId: -1,
          externalSystemReference: externalSystemReference ?? "",
          channel: channel ?? "",
          profileDTO: profileDTO);

      return _customerDataApiClient.registerCustomer(registerRequest);
    } on DioError {
      rethrow;
    }
  }

  Future<AccountDetailsResponse> getCustomerAccountsByAccId(
      {bool isActive = true,
      String? accountNumber,
      String? accountId,
      String? customerId,
      bool buildChildRecords = true,
      bool activeRecordsOnly = true}) async {
    try {
      final map = {
        'isActive': isActive ? 'Y' : 'N',
        'customerId': customerId ?? -1,
        'buildChildRecords': buildChildRecords,
        'activeRecordsOnly': activeRecordsOnly,
        'tagSiteId': _executionContextDTO.siteId ?? -1,
        'accountId': accountId ?? -1,
        'chkVipCustomer': false,
        'chkTechCards': false,
        'buildActivityHistory': false,
        'buildGamePlayHistory': false,
        'buildBarCode': false,
        'includeFutureEntitlements': false,
        'closedTransactionsOnly': true,
        'gamePlayHistoryPageNumber': 0,
        'activityHistoryPageNumber': 0,
        'pageNumber': 0,
        'pageSize': 0,
        'lastActivityHistoryId': -1,
        'lastGamePlayHistoryId': -1,
      };

      if (accountNumber != null) {
        map['accountNumber'] = accountNumber;
      }

      return _customerDataApiClient.getCustomerAccounts(map);
    } on DioError {
      rethrow;
    }
  }

  Future<AccountDetailsResponse> getCustomerAccounts(
      {bool isActive = true,
      String? accountNumber,
      int? accountId,
      required int customerId,
      bool buildChildRecords = true,
      bool activeRecordsOnly = true}) async {
    try {
      final map = {
        'isActive': isActive ? 'Y' : 'N',
        'customerId': customerId,
        'buildChildRecords': buildChildRecords,
        'activeRecordsOnly': activeRecordsOnly,
        'tagSiteId': _executionContextDTO.siteId ?? -1,
        'accountNumber': accountNumber
      };

      if (accountId != null) {
        map['accountId'] = accountId;
        map['chkVipCustomer'] = false;
        map['chkTechCards'] = false;
        map['buildActivityHistory'] = false;
        map['buildGamePlayHistory'] = false;
        map['buildBarCode'] = false;
        map['includeFutureEntitlements'] = false;
        map['closedTransactionsOnly'] = true;
      }

      return _customerDataApiClient.getCustomerAccounts(map);
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerSearchResponse> getCustomer({required int customerId}) async {
    try {
      return _customerDataApiClient.getCustomer({
        'customerId': customerId,
        'buildChildRecords': true,
        'activeRecordsOnly': true,
        'loadSignedWaivers': false,
        'loadSignedWaiverFileContent': false
      });
    } on DioError {
      rethrow;
    }
  }

  Future<AccountDetailsResponse> getCardDetails(
      {bool isActive = true,
      required String accountNo,
      String? accountId,
      bool buildChildRecords = true,
      bool activeRecordsOnly = true}) async {
    try {
      return _customerDataApiClient.getCustomerAccounts({
        'isActive': isActive ? 'Y' : 'N',
        'accountNumber': accountNo,
        'buildChildRecords': buildChildRecords,
        'activeRecordsOnly': activeRecordsOnly,
        'tagSiteId': _executionContextDTO.siteId ?? -1,
        'accountId': accountId ?? -1,
        'chkVipCustomer': false,
        'chkTechCards': false,
        'buildActivityHistory': false,
        'buildGamePlayHistory': false,
        'buildBarCode': false,
        'includeFutureEntitlements': false,
        'closedTransactionsOnly': true,
        'gamePlayHistoryPageNumber': 0,
        'activityHistoryPageNumber': 0,
        'pageNumber': 0,
        'pageSize': 0,
        'lastActivityHistoryId': -1,
        'lastGamePlayHistoryId': -1,
      });
    } on DioError {
      rethrow;
    }
  }

  Future<AccountDetailsResponse> getCardDetailsByAccountId(
      {bool isActive = true,
      required String accountId,
      bool buildChildRecords = true,
      bool activeRecordsOnly = true}) async {
    try {
      return _customerDataApiClient.getCustomerAccounts({
        'isActive': isActive ? 'Y' : 'N',
        'accountId': accountId,
        'buildChildRecords': buildChildRecords,
        'activeRecordsOnly': activeRecordsOnly
      });
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerResponse> updateCustomerProfile(
      {required int customerId, required ProfileDTO profileDTO}) {
    try {
      return _customerDataApiClient.updateCustomerProfile(
          customerId, profileDTO);
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerResponse> addContact(
      {required int customerId, required ContactDTO contactDTO}) {
    try {
      return _customerDataApiClient.addContact(customerId, [contactDTO]);
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerResponse> updateContact(
      {required int customerId, required ContactDTO contactDTO}) {
    try {
      return _customerDataApiClient.updateContact(customerId, [contactDTO]);
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerResponse> addAddress(
      {required int customerId, required AddressDTO addressDTO}) {
    try {
      return _customerDataApiClient.addAddress(customerId, [addressDTO]);
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerResponse> updateAddress(
      {required int customerId, required AddressDTO addressDTO}) {
    try {
      return _customerDataApiClient.updateAddress(customerId, [addressDTO]);
    } on DioError {
      rethrow;
    }
  }

  Future<List<CardSerialNumberData>> getCardsSerialNumbers(
      {required String fromSerialNumber,
      required String toSerialNumber,
      required String alreadyIssued}) async {
    try {
      final List<CardSerialNumberData> cardSerialNumberData = [];
      CardSerialNumbersResponse? cardSerialNumbersResponse =
          await _customerDataApiClient.getCardsSerialNumbers({
        'fromSerialNumber': fromSerialNumber,
        'toSerialNumber': toSerialNumber,
        'alreadyIssued': alreadyIssued
      });
      for (CardSerialNumberData element
          in cardSerialNumbersResponse.data ?? []) {
        cardSerialNumberData.add(element);
      }
      return cardSerialNumberData;
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerRelationshipResponse> getCustomerRelationships({
    required bool buildChildRecords,
    required int customerId,
    required bool isActive,
  }) async {
    try {
      return _customerDataApiClient.getCustomerRelationships({
        'buildChildRecords': buildChildRecords,
        'customerId': customerId,
        'isActive': isActive
      });
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerRelationshipResponse> addOrUpdateRelationships(
      {required int customerId,
      required UpdateRelationshipRequest updateRelationshipRequest}) {
    try {
      return _customerDataApiClient
          .addOrUpdateRelationships(customerId, [updateRelationshipRequest]);
    } on DioError {
      rethrow;
    }
  }

  Future<CustomerRelationshipResponse> updateRelationships(
      {required int customerId,
      required CustomerRelationshipData updateRelationshipRequest}) {
    try {
      return _customerDataApiClient
          .updateRelationships(customerId, [updateRelationshipRequest]);
    } on DioError {
      rethrow;
    }
  }

  Future<LinkAccountDetailsResponse> linkNewCard(
      {required int customerId,
      required AccountDetailsData linkAccountRequest}) {
    try {
      return _customerDataApiClient.linkNewCard(customerId, linkAccountRequest);
    } on DioError {
      rethrow;
    }
  }

  Future<SummariesResponse> getGameSummary(
      {required int accountId,
      required int currentPage,
      required int pageSize,
      required String toDate,
      required String fromDate}) {
    try {
      return _customerDataApiClient.getGameSummary(accountId, {
        'accountId': accountId,
        'currentPage': currentPage,
        'pageSize': pageSize,
        'fromDate': fromDate,
        'toDate': toDate,
      });
    } on DioError {
      rethrow;
    }
  }

  Future<PurchaseResponse> getPurchaseSummary(
      {required int accountId,
      required int currentPage,
      required int pageSize,
      required String toDate,
      required String fromDate}) {
    try {
      return _customerDataApiClient.getPurchaseSummary(accountId, {
        'accountId': accountId,
        'currentPage': currentPage,
        'pageSize': pageSize,
        'fromDate': fromDate,
        'toDate': toDate,
        'addSummaryRow': false,
        'lastRowNumberId': -1
      });
    } on DioError {
      rethrow;
    }
  }

  Future<SummariesCountsResponse> getGameSummaryCounts(
      {required int accountId,
      required String toDate,
      required String fromDate}) {
    try {
      return _customerDataApiClient.getGameSummaryCounts(accountId, {
        'accountId': accountId,
        'fromDate': fromDate,
        'toDate': toDate,
      });
    } on DioError {
      rethrow;
    }
  }

  Future<SummariesCountsResponse> getPurchaseCounts(
      {required int accountId,
      required String toDate,
      required String fromDate}) {
    try {
      return _customerDataApiClient.getPurchaseCounts(accountId, {
        'accountId': accountId,
        'fromDate': fromDate,
        'toDate': toDate,
      });
    } on DioError {
      rethrow;
    }
  }

  Future<LoyaltyAttributeContainerResponse?> getLoyaltyAttribute() async {
    try {
      _loyaltyAttributeContainerResponse =
          await _customerDataApiClient.getLoyaltyAttributeContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
        'rebuildCache': false,
        'hash': null,
      });

      return _loyaltyAttributeContainerResponse;
    } on DioError {
      rethrow;
    }
  }

  Future<CountryContainerResponse?> getCountryContainer() async {
    try {
      _countryContainerResponse =
          await _customerDataApiClient.getCountryContainer({
        'siteId': _executionContextDTO.siteId ?? 0,
      });

      return _countryContainerResponse;
    } on DioError {
      rethrow;
    }
  }

  Future<MembershipSummaryResponse> getMembershipSummary(
      {required int customerId}) {
    try {
      return _customerDataApiClient.getMembershipSummary(customerId, {
        'customerId': customerId,
      });
    } on DioError {
      rethrow;
    }
  }

  void clear() {
    _customerSearchCountResponse = null;
    _basicSearchConditions.clear();
  }
}
