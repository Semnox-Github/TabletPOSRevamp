import 'dart:convert';
import 'package:execution_context/builder.dart';
import 'package:http/http.dart' as http;
import 'package:orders_data/models/facility_model.dart';
import 'package:logs_data/logger.dart';

class FacilityRepository {
  var execContextBL;
  var execContextDTO;
  Future<List<FacilityModel>> getFacilities() async {
    execContextBL = await ExecutionContextBuilder.build();
    execContextDTO = execContextBL.getExecutionContext();
    Log.v("WebApiToken : "+execContextDTO.webApiToken.toString());
    Log.v("siteId : "+execContextDTO.siteId.toString());
    String endPoint =
        "https://parafaitposredesigntestapi.parafait.com/api/Product/FacilityContainer?siteId=${execContextDTO.siteId}&hash=null&rebuildCache=false";
    http.Response response = await http.get(
        Uri.parse(endPoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': execContextDTO.webApiToken ?? ''
      },
    );
    if(response.statusCode == 200){
      final result = jsonDecode(response.body)['data']['FacilitysContainerDTOList'];
      Log.v('***********');Log.v(result);Log.v('***********');

      return result.map<FacilityModel>(((e) => FacilityModel.fromJson(e))).toList();
    }else{
      Log.v("!!!!!ERROR!!!!!");
      throw Exception(response.reasonPhrase);
    }
  }
}

