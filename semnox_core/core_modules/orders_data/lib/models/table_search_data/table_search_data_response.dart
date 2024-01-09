
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/table_search_data/table_search_data.dart';

part 'table_search_data_response.freezed.dart';
part 'table_search_data_response.g.dart';

@freezed
class TableSearchDataResponse with _$TableSearchDataResponse{
  const factory TableSearchDataResponse({
    List<TableSearchData>? data,
    String? exception,
  }) = _TableSearchDataResponse;

  factory TableSearchDataResponse.fromJson(Map<String,dynamic> json) => _$TableSearchDataResponseFromJson(json);

}