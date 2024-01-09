
import 'package:freezed_annotation/freezed_annotation.dart';

import 'customer_relationship_data.dart';

part 'customer_relationship_response.freezed.dart';
part 'customer_relationship_response.g.dart';

@freezed
class CustomerRelationshipResponse with _$CustomerRelationshipResponse {
  const factory CustomerRelationshipResponse({
    List<CustomerRelationshipData>? data,
    String? exception,
  }) = _CustomerRelationshipResponse;

  factory CustomerRelationshipResponse.fromJson(Map<String, dynamic> json) => _$CustomerRelationshipResponseFromJson(json);
}