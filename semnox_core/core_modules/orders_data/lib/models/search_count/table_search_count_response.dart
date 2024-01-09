
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_search_count_response.freezed.dart';
part 'table_search_count_response.g.dart';

@freezed
class TableSearchCountResponse with _$TableSearchCountResponse{
  const factory TableSearchCountResponse({
    int? data,
    String? exception,
  }) = _TableSearchCountResponse;

  factory TableSearchCountResponse.fromJson(Map<String,dynamic> json) => _$TableSearchCountResponseFromJson(json);

}