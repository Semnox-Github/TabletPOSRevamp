import 'package:customer_data/models/customer_data.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';

import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class CustomerDetailItem extends StatelessWidget{

  CustomerData? _data;
  int _index;
  String? _dateFormat;

  CustomerDetailItem(this._data,this._index,this._dateFormat);

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       if(!(_data?.toJson().keys.toList()[_index].toString().toLowerCase() ?? "").contains("dto") && !(_data?.toJson().keys.toList()[_index].toString() ?? "").contains("Date"))...[
         Text(_data?.toJson().keys.toList()[_index].toString() ?? "", style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.start,),
         Text(_data?.toJson().values.toList()[_index] == null ? "-" : (_data?.toJson().values.toList()[_index].toString() ?? ""), style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)), textAlign: TextAlign.start),
         const SizedBox(height: 8,),
       ],
       if((_data?.toJson().keys.toList()[_index].toString() ?? "").contains("Date"))...[
         Text(_data?.toJson().keys.toList()[_index].toString() ?? "", style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(18)),textAlign: TextAlign.start,),
         Text(_data?.toJson().values.toList()[_index] == null ? "-" : (DateFormat(_dateFormat).format(DateTime.parse(_data?.toJson().values.toList()[_index]))), style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)), textAlign: TextAlign.start),
         const SizedBox(height: 8,),
       ],
     ],
   );
  }

}