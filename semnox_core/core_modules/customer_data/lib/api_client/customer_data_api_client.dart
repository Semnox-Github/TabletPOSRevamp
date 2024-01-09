import 'dart:io';

import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/account_details/summaries_counts_response.dart';
import 'package:customer_data/models/account_details/summaries_response.dart';
import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/card_serial_numbers/card_serial_numbers_response.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/customer_search/customer_search_response.dart';
import 'package:customer_data/models/profile_dto.dart';
import 'package:customer_data/models/request/customer_register/customer_register_request.dart';
import 'package:customer_data/models/search_count/customer_search_count_response.dart';
import 'package:customer_data/models/customer_response.dart';
import 'package:customer_data/models/request/customer_search/customer_search_condition.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/account_details/account_details_data.dart';
import '../models/account_details/link_account_details_response.dart';
import '../models/account_details/purchase_response.dart';
import '../models/country_container/country_container_response.dart';
import '../models/loyalty_attribute_container/loyalty_attribute_container_response.dart';
import '../models/membership_summary/membership_summary_response.dart';
import '../models/relationships/customer_relationship_data.dart';
import '../models/relationships/customer_relationship_response.dart';
import '../models/relationships/update_relationship_request.dart';

part 'customer_data_api_client.g.dart';

@RestApi()
abstract class CustomerDataApiClient {
  factory CustomerDataApiClient(Dio dio, {String baseUrl}) = _CustomerDataApiClient;

  static const _customerSearchCountEndPoint = "api/Customer/CustomerSearchCounts";
  static const _customerSearchEndPoint = "api/Customer/CustomerSearch/";
  static const _customersEndPoint = "api/Customer/Customers";
  static const _accountsEndPoint = "api/Customer/Account/Accounts";
  static const _updateProfileEndPoint = "api/Customer/Customers/{customerId}/Profile";
  static const _contactsEndPoint = "api/Customer/Customers/{customerId}/Contacts";
  static const _addressEndPoint = "api/Customer/customers/{customerId}/Address";
  static const _addressUpdateEndPoint = "api/Customer/Customers/{customerId}/Addresses";
  static const _getCardSerialNumbers = 'api/Customer/CardSerialMappings';
  static const _relationshipListEndPont = "api/Customer/Customers/Relationships";
  static const _newRelationshipEndPont = "api/Customer/Customers/{customerId}/Relationships";
  static const _linkAccountEndPoint = "api/Customer/Customers/{customerId}/AddAccount";
  static const _getSummaryEndPoint = "api/Customer/Account/{accountId}/GamePlaySummaries";
  static const _getSummaryCountsEndPoint = "api/Customer/Account/{accountId}/GamePlaySummaryCounts";
  static const _getPurchaseEndPoint = "api/Customer/Account/{accountId}/AccountActivity";
  static const _getPurchaseCountsEndPoint = "api/Customer/Account/{accountId}/AccountActivityCounts";
  static const _loyaltyAttributeContainerEndPoint = "api/Promotion/LoyaltyAttributesContainer";
  static const _getMembershipSummary = "api/Customer/{customerId}/Summary";
  static const _countryContainerEndPoint = 'api/Common/CountriesContainer';




  @POST(_customerSearchCountEndPoint)
  Future<CustomerSearchCountResponse> getCustomerSearchCount(
      @Queries() Map<String, dynamic> queries,
      @Body() List<CustomerSearchCondition> conditions);

  @POST(_customerSearchEndPoint)
  Future<CustomerSearchResponse> searchCustomers(
      @Queries() Map<String, dynamic> queries,
      @Body() List<CustomerSearchCondition> conditions);

  @POST(_customersEndPoint)
  Future<CustomerResponse> registerCustomer(@Body() CustomerRegisterRequest registerRequest);

  @GET(_accountsEndPoint)
  Future<AccountDetailsResponse> getCustomerAccounts(@Queries() Map<String, dynamic> queries);

  @GET(_customersEndPoint)
  Future<CustomerSearchResponse> getCustomer(@Queries() Map<String, dynamic> queries);

  @PUT(_updateProfileEndPoint)
  Future<CustomerResponse> updateCustomerProfile(@Path() int customerId, @Body() ProfileDTO profileDTO);

  @POST(_contactsEndPoint)
  Future<CustomerResponse> addContact(@Path() int customerId, @Body() List<ContactDTO> contactDTOs);

  @PUT(_contactsEndPoint)
  Future<CustomerResponse> updateContact(@Path() int customerId, @Body() List<ContactDTO> contactDTOs);

  @POST(_addressEndPoint)
  Future<CustomerResponse> addAddress(@Path() int customerId, @Body() List<AddressDTO> addressDTOs);

  @PUT(_addressUpdateEndPoint)
  Future<CustomerResponse> updateAddress(@Path() int customerId, @Body() List<AddressDTO> addressDTOs);

  @GET(_getCardSerialNumbers)
  Future<CardSerialNumbersResponse> getCardsSerialNumbers(@Queries() Map<String, dynamic> queries,);

  @GET(_relationshipListEndPont)
  Future<CustomerRelationshipResponse> getCustomerRelationships(@Queries() Map<String, dynamic> queries);

  @POST(_newRelationshipEndPont)
  Future<CustomerRelationshipResponse> addOrUpdateRelationships(@Path() int customerId, @Body() List<UpdateRelationshipRequest> updateRelationshipRequest);

  @PUT(_newRelationshipEndPont)
  Future<CustomerRelationshipResponse> updateRelationships(@Path() int customerId, @Body() List<CustomerRelationshipData> updateRelationshipRequest);

  @POST(_linkAccountEndPoint)
  Future<LinkAccountDetailsResponse> linkNewCard(@Path() int customerId, @Body() AccountDetailsData linkAccountRequest);

  @GET(_getSummaryEndPoint)
  Future<SummariesResponse> getGameSummary(@Path() int accountId,@Queries() Map<String, dynamic> queries);

  @GET(_getSummaryCountsEndPoint)
  Future<SummariesCountsResponse> getGameSummaryCounts(@Path() int accountId,@Queries() Map<String, dynamic> queries);

  @GET(_getPurchaseCountsEndPoint)
  Future<SummariesCountsResponse> getPurchaseCounts(@Path() int accountId,@Queries() Map<String, dynamic> queries);

  @GET(_getPurchaseEndPoint)
  Future<PurchaseResponse> getPurchaseSummary(@Path() int accountId,@Queries() Map<String, dynamic> queries);

  @GET(_loyaltyAttributeContainerEndPoint)
  Future<LoyaltyAttributeContainerResponse> getLoyaltyAttributeContainer(@Queries() Map<String, dynamic> queries);

  @GET(_getMembershipSummary)
  Future<MembershipSummaryResponse> getMembershipSummary(@Path() int customerId,@Queries() Map<String, dynamic> queries);

  @GET(_countryContainerEndPoint)
  Future<CountryContainerResponse> getCountryContainer(@Queries() Map<String, dynamic> queries);
}
