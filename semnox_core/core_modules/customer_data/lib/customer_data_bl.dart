import 'package:customer_data/customer_data_service.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:customer_data/models/customer_response.dart';
import 'package:customer_data/models/customer_search/customer_search_response.dart';
import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_response.dart';
import 'package:customer_data/models/profile_dto.dart';
import 'package:customer_data/models/request/customer_search/customer_search_condition.dart';

import 'models/account_details/account_details_data.dart';
import 'models/account_details/link_account_details_response.dart';
import 'models/account_details/purchase_response.dart';
import 'models/account_details/summaries_counts_response.dart';
import 'models/account_details/summaries_response.dart';
import 'models/card_serial_numbers/serial_number_data.dart';
import 'models/country_container/country_container_response.dart';
import 'models/membership_summary/membership_summary_response.dart';
import 'models/relationships/customer_relationship_data.dart';
import 'models/relationships/customer_relationship_response.dart';
import 'models/relationships/update_relationship_request.dart';

abstract class CustomerDataBLContract {
  Future<CustomerSearchResponse> searchCustomerBasic({
    int currentPage,
    int pageSize,
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
    String? memberShipId,
  });
  int? getTotalCustomers();
  int? getTotalPages();

  Future<CustomerSearchResponse> searchCustomerAdvanced(
      {int currentPage = 0,
      int pageSize = 50,
      bool isAscending = false,
      required List<CustomerSearchCondition> conditionsList});

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
      required List<AddressDTO> addressList});

  Future<CustomerSearchResponse> getCustomer({required int customerId});

  Future<AccountDetailsResponse> getCustomerAccounts({
    bool isActive = true,
    required int customerId,
    bool buildChildRecords = true,
    bool activeRecordsOnly = true,
    String? accountNumber,
    int? accountId,
  });

  Future<AccountDetailsResponse> getCardDetails(
      {bool isActive = true,
      required String accountNo,
      bool buildChildRecords = true,
      bool activeRecordsOnly,
      String? accountNumber});

  Future<AccountDetailsResponse> getCardDetailsByAccountId({
    bool isActive = true,
    String? accountId,
    String? customerId,
    bool buildChildRecords = true,
    bool activeRecordsOnly,
  });

  Future<AccountDetailsResponse> getCardDetailsByAccountNumber({
    bool isActive = true,
    String? accountId,
    String? customerId,
    bool buildChildRecords = true,
    bool activeRecordsOnly,
  });

  Future<CustomerRelationshipResponse> getCustomerRelationships(
      {bool isActive = false, required int customerId});

  Future<CustomerResponse> updateCustomerProfile({
    required int customerId,
    required ProfileDTO profileDTO,
  });

  Future<CustomerResponse> addContact({
    required int customerId,
    required ContactDTO contactDTO,
  });

  Future<CustomerResponse> updateContact({
    required int customerId,
    required ContactDTO contactDTO,
  });

  Future<CustomerResponse> addAddress({
    required int customerId,
    required AddressDTO addressDTO,
  });

  Future<CustomerResponse> updateAddress({
    required int customerId,
    required AddressDTO addressDTO,
  });

  Future<List<CardSerialNumberData>> getCardsSerialNumbers(
      {required String fromSerialNumber,
      required String toSerialNumber,
      required String alreadyIssued});

  Future<CustomerRelationshipResponse> addOrUpdateRelationships({
    required int customerId,
    required UpdateRelationshipRequest updateRelationshipRequest,
  });
  Future<CustomerRelationshipResponse> updateRelationships({
    required int customerId,
    required CustomerRelationshipData updateRelationshipRequest,
  });

  Future<LinkAccountDetailsResponse> linkNewCard({
    required int customerId,
    required AccountDetailsData linkAccountRequest,
  });

  Future<SummariesResponse> getGameSummary(
      {required int accountId,
      required int currentPage,
      required int pageSize,
      required String toDate,
      required String fromDate});

  Future<PurchaseResponse> getPurchaseSummary(
      {required int accountId,
      required int currentPage,
      required int pageSize,
      required String toDate,
      required String fromDate});

  Future<SummariesCountsResponse> getGameSummaryCounts(
      {required int accountId,
      required String toDate,
      required String fromDate});

  Future<SummariesCountsResponse> getPurchaseCounts(
      {required int accountId,
      required String toDate,
      required String fromDate});

  Future<LoyaltyAttributeContainerResponse?> getLoyaltyAttribute();

  Future<MembershipSummaryResponse> getMembershipSummary(
      {required int customerId});

  Future<CountryContainerResponse?> getCountryContainer();


  void clear();
}

class CustomerDataBLImpl implements CustomerDataBLContract {
  final CustomerDataService _customerSearchDataService;

  CustomerDataBLImpl(this._customerSearchDataService);

  @override
  Future<CustomerSearchResponse> searchCustomerBasic({
    int currentPage = 0,
    int pageSize = 50,
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
    String? memberShipId,
  }) {
    return _customerSearchDataService.searchCustomerBasic(
        currentPage: currentPage,
        pageSize: pageSize,
        isAscending: isAscending,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        uniqueId: uniqueId,
        phoneNo: phoneNo,
        isExactPhoneNeeded: isExactPhoneNeeded,
        email: email,
        isExactEmailNeeded: isExactEmailNeeded,
        siteId: siteId,
        memberShipId: memberShipId);
  }

  @override
  int? getTotalCustomers() {
    return _customerSearchDataService.getTotalCustomers();
  }

  @override
  int? getTotalPages() {
    return _customerSearchDataService.getTotalPages();
  }

  @override
  Future<CustomerSearchResponse> searchCustomerAdvanced(
      {int currentPage = 0,
      int pageSize = 50,
      bool isAscending = false,
      required List<CustomerSearchCondition> conditionsList}) {
    return _customerSearchDataService.searchCustomerAdvanced(
        currentPage: currentPage,
        pageSize: pageSize,
        isAscending: false,
        conditionsList: conditionsList);
  }

  @override
  Future<CustomerResponse> registerCustomer(
      {  required String title,
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
      required List<AddressDTO> addressList}) {
    return _customerSearchDataService.registerCustomer(
        title : title,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        dob: dob,
        policyTermsAccepted: policyTermsAccepted,
        idProofUrl: idProofUrl,
        nickName : nickName,
        gender : gender,
        anniversary : anniversary,
        uniqueIdentifier : uniqueIdentifier,
        rightHanded  : rightHanded,
        teamUser : teamUser,
        company : company,
        designation : designation,
        taxCode : taxCode,
        notes : notes,
        externalSystemReference : externalSystemReference,
        channel : channel,
        type : type,
        userName : userName,
        membership : membership,
        verified : verified,
        contactList: contactList,
        addressList: addressList);
  }

  @override
  Future<AccountDetailsResponse> getCustomerAccounts(
      {bool isActive = true,
      required int customerId,
      bool buildChildRecords = true,
      bool activeRecordsOnly = true,
      String? accountNumber,
      int? accountId}) {
    return _customerSearchDataService.getCustomerAccounts(
        isActive: isActive,
        customerId: customerId,
        accountId: accountId,
        buildChildRecords: buildChildRecords,
        activeRecordsOnly: activeRecordsOnly,
        accountNumber: accountNumber);
  }

  @override
  Future<AccountDetailsResponse> getCardDetails(
      {bool isActive = true,
      required String accountNo,
      String? accountNumber,
      bool buildChildRecords = true,
      bool activeRecordsOnly = true}) {
    return _customerSearchDataService.getCardDetails(
        isActive: isActive,
        accountNo: accountNo,
        buildChildRecords: buildChildRecords,
        activeRecordsOnly: activeRecordsOnly);
  }

  @override
  Future<AccountDetailsResponse> getCardDetailsByAccountId(
      {bool isActive = true,
      String? accountId,
      String? customerId,
      bool buildChildRecords = true,
      bool activeRecordsOnly = true}) {
    return _customerSearchDataService.getCustomerAccountsByAccId(
      accountNumber: accountId,
      customerId: customerId,
      buildChildRecords: buildChildRecords,
      isActive: isActive,
      activeRecordsOnly: activeRecordsOnly,
    );
  }

  @override
  Future<AccountDetailsResponse> getCardDetailsByAccountNumber(
      {bool isActive = true,
      String? accountId,
      String? customerId,
      bool buildChildRecords = true,
      bool activeRecordsOnly = true}) {
    return _customerSearchDataService.getCustomerAccountsByAccId(
      accountId: accountId,
      customerId: customerId,
      buildChildRecords: buildChildRecords,
      isActive: isActive,
      activeRecordsOnly: activeRecordsOnly,
    );
  }

  @override
  Future<CustomerSearchResponse> getCustomer({required int customerId}) {
    return _customerSearchDataService.getCustomer(customerId: customerId);
  }

  @override
  Future<CustomerResponse> updateCustomerProfile(
      {required int customerId, required ProfileDTO profileDTO}) {
    return _customerSearchDataService.updateCustomerProfile(
        customerId: customerId, profileDTO: profileDTO);
  }

  @override
  Future<CustomerResponse> addContact(
      {required int customerId, required ContactDTO contactDTO}) {
    return _customerSearchDataService.addContact(
        customerId: customerId, contactDTO: contactDTO);
  }

  @override
  Future<CustomerResponse> updateContact(
      {required int customerId, required ContactDTO contactDTO}) {
    return _customerSearchDataService.updateContact(
        customerId: customerId, contactDTO: contactDTO);
  }

  @override
  Future<CustomerResponse> addAddress(
      {required int customerId, required AddressDTO addressDTO}) {
    return _customerSearchDataService.addAddress(
        customerId: customerId, addressDTO: addressDTO);
  }

  @override
  Future<CustomerResponse> updateAddress(
      {required int customerId, required AddressDTO addressDTO}) {
    return _customerSearchDataService.updateAddress(
        customerId: customerId, addressDTO: addressDTO);
  }

  @override
  Future<List<CardSerialNumberData>> getCardsSerialNumbers(
      {required String fromSerialNumber,
      required String toSerialNumber,
      required String alreadyIssued}) {
    return _customerSearchDataService.getCardsSerialNumbers(
        fromSerialNumber: fromSerialNumber,
        toSerialNumber: toSerialNumber,
        alreadyIssued: alreadyIssued);
  }

  @override
  Future<CustomerRelationshipResponse> getCustomerRelationships(
      {bool isActive = false, required int customerId}) {
    return _customerSearchDataService.getCustomerRelationships(
      buildChildRecords: true,
      isActive: isActive,
      customerId: customerId,
    );
  }

  @override
  Future<CustomerRelationshipResponse> addOrUpdateRelationships(
      {required int customerId,
      required UpdateRelationshipRequest updateRelationshipRequest}) {
    return _customerSearchDataService.addOrUpdateRelationships(
        customerId: customerId,
        updateRelationshipRequest: updateRelationshipRequest);
  }

  @override
  Future<CustomerRelationshipResponse> updateRelationships(
      {required int customerId,
      required CustomerRelationshipData updateRelationshipRequest}) {
    return _customerSearchDataService.updateRelationships(
        customerId: customerId,
        updateRelationshipRequest: updateRelationshipRequest);
  }

  @override
  Future<LinkAccountDetailsResponse> linkNewCard(
      {required int customerId,
      required AccountDetailsData linkAccountRequest}) {
    return _customerSearchDataService.linkNewCard(
        customerId: customerId, linkAccountRequest: linkAccountRequest);
  }

  @override
  void clear() {
    _customerSearchDataService.clear();
  }

  @override
  Future<SummariesResponse> getGameSummary(
      {required int accountId,
      required int currentPage,
      required int pageSize,
      required String toDate,
      required String fromDate}) {
    return _customerSearchDataService.getGameSummary(
        accountId: accountId,
        currentPage: currentPage,
        pageSize: pageSize,
        toDate: toDate,
        fromDate: fromDate);
  }

  @override
  Future<SummariesCountsResponse> getGameSummaryCounts(
      {required int accountId,
      required String toDate,
      required String fromDate}) {
    return _customerSearchDataService.getGameSummaryCounts(
        accountId: accountId, toDate: toDate, fromDate: fromDate);
  }

  @override
  Future<SummariesCountsResponse> getPurchaseCounts(
      {required int accountId,
      required String toDate,
      required String fromDate}) {
    return _customerSearchDataService.getPurchaseCounts(
        accountId: accountId, toDate: toDate, fromDate: fromDate);
  }

  @override
  Future<PurchaseResponse> getPurchaseSummary(
      {required int accountId,
      required int currentPage,
      required int pageSize,
      required String toDate,
      required String fromDate}) {
    return _customerSearchDataService.getPurchaseSummary(
        accountId: accountId,
        currentPage: currentPage,
        pageSize: pageSize,
        toDate: toDate,
        fromDate: fromDate);
  }

  @override
  Future<LoyaltyAttributeContainerResponse?> getLoyaltyAttribute() {
    return _customerSearchDataService.getLoyaltyAttribute();
  }

  @override
  Future<MembershipSummaryResponse> getMembershipSummary(
      {required int customerId}) {
    return _customerSearchDataService.getMembershipSummary(
        customerId: customerId);
  }
  @override
  Future<CountryContainerResponse?> getCountryContainer() {
    return _customerSearchDataService.getCountryContainer();
  }
}
