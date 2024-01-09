import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class TransactionDateForm extends StatefulWidget{
  TextEditingController? controller ;
  String title;

  TransactionDateForm({super.key, required this.controller, required this.title});

  @override
  State<TransactionDateForm> createState() => _TransactionDateFormState();
}

class _TransactionDateFormState extends State<TransactionDateForm> {
  ParafaitDefaultContainerDTO? _dateObject;

  ConfigurationResponse? _config;

  String? dateFormat;

  @override
  void initState() {
    super.initState();
    _getConfigurations(context);
  }

  @override
  Widget build(BuildContext context) {
   SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
   SizeConfig.init(context);
   return Expanded(child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(widget.title, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
       const SizedBox(height: 4.0,),
       TextFormField(
         controller: widget.controller,
         textAlign: TextAlign.start,
         readOnly: true,
         style: theme.subtitle3?.copyWith(color: theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),
         maxLines: 1,
         decoration: InputDecoration(
             isDense: true,
             contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(10.0),
             ),
             hintText: "Enter",
             hintStyle: theme.subtitle3?.copyWith(color: theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),
             suffixIcon: Padding(
               padding: const EdgeInsets.only(left : 4.0,right: 8.0),
               child: Image.asset('assets/ic_date.png',color: theme.secondaryColor,),
             ),
             suffixIconConstraints: const BoxConstraints()
         ),
         onTap: () async {
           var birthDate = widget.controller?.text;
           DateTime? selectedDate;
           TimeOfDay? pickedTime = TimeOfDay(hour: 00, minute: 00);
           if(birthDate != '') {
             //DateFormat dateFormat = DateFormat('dd-MM-yyyy hh:mm:ss a');
             DateFormat formatDate = DateFormat(dateFormat);
             selectedDate = formatDate.parse(birthDate ?? "");
           }
           DateTime? pickedDate = await showDatePicker(context: context,
               builder: (BuildContext context, Widget? child) {
                 return Theme(data: ThemeData?.light().copyWith(
                     colorScheme: const ColorScheme.light(
                       primary: Colors.black,
                       onPrimary: Colors.white,
                       surface: Colors.white,
                       onSurface: Colors.black,
                     )
                 ),
                     child: child!);
               },
               initialDate: selectedDate ?? DateTime.now(),
               firstDate: DateTime(1950),
               lastDate: DateTime(2100)).whenComplete(() async {
             pickedTime = await showTimePicker(
               context: context,
               builder: (BuildContext context, Widget? child) {
                 return Theme(data: ThemeData?.light().copyWith(
                     colorScheme: const ColorScheme.light(
                       primary: Colors.black,
                       onPrimary: Colors.white,
                       surface: Colors.white,
                       onSurface: Colors.black,
                     )
                 ),
                     child: child!);
               },
               initialTime: TimeOfDay.now(),
             );
           });

           if(pickedTime != null && pickedDate != null){
             String hour = pickedTime!.hour.toString();
             String minute = pickedTime!.minute.toString();
             String time ;
             if(int.parse(hour) > 12){
               time = "${int.parse(hour)-12}:$minute:00 PM";
             }else{
               time = hour + ':' + minute + ':' + '00' +" AM";
             }
             String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
             formattedDate = "$formattedDate $time";
             formattedDate = DateFormat(dateFormat).format(DateFormat("dd-MMM-yyyy hh:mm:ss a").parse(formattedDate));
             widget.controller?.text = formattedDate;
           }else if(pickedDate != null){
             String formattedDate = DateFormat('dd-MMM-yyyy hh:mm:ss a').format(pickedDate);
             formattedDate = DateFormat(dateFormat).format(DateTime(pickedDate.year, pickedDate.month, pickedDate.day, 4, 0, 0,));
             widget.controller?.text = formattedDate; //set output date to TextField value.
           }
         },),
     ],
   ));
  }

  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _config = await masterDataBl.getConfigurations();
    dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    dateFormat = dateFormat?.replaceAll('tt', 'a');
  }
}