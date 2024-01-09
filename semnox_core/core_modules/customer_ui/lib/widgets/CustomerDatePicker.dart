import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/size_config.dart';

class CustomerDatePicker extends StatefulWidget{
  String title;
  String hint;
  TextEditingController? controller ;
  bool isBrithDate;
  bool? visible;
  String? validation;
  String? ignoreBirthYear;

  CustomerDatePicker({required this.title, required this.hint,this.controller, required this.isBrithDate,this.validation,
  this.ignoreBirthYear});

  @override
  State<CustomerDatePicker> createState() => _CustomerDatePickerState();
}

class _CustomerDatePickerState extends State<CustomerDatePicker> {
  String? _dateFormat;

  Future getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATE_FORMAT");
  }
  @override
  void initState() {
    super.initState();
    getConfigurations(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: theme.heading5?.copyWith(
            fontSize: SizeConfig.getFontSize(20),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal
        ),),
        const SizedBox(height: 4.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: widget.controller,
                textAlign: TextAlign.start,
                readOnly: true,
                style:theme.heading5?.copyWith(
                    fontSize: SizeConfig.getFontSize(18),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500
                ),
                validator: (value){
                  if(widget.validation == null || widget.validation == ''){
                    return null;
                  }else if (value == null || value.isEmpty) {
                    return widget.validation;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:  EdgeInsets.fromLTRB(SizeConfig.getSize(20), SizeConfig.getSize(20), 2, SizeConfig.getSize(10)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: widget.hint,
                    hintStyle: theme.heading5?.copyWith(
                        fontSize: SizeConfig.getFontSize(18),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset('assets/ic_date.png',height:SizeConfig.getSize(24),width:SizeConfig.getSize(24),color: theme.secondaryColor,),
                    ),
                    suffixIconConstraints: const BoxConstraints()
                ),
               onTap: () async {
                 var birthDate = widget.controller?.text  ?? ''/*== ''?'': _getFormattedDate(widget.controller.text);*/;
                 DateTime? selectedDate;
                 if(birthDate != '') {
                   DateFormat dateFormat = widget.ignoreBirthYear == "Y" ?   DateFormat("dd-MM") : DateFormat(_dateFormat ?? 'dd-MM-yyyy');
                   selectedDate = dateFormat.parse(birthDate);
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
                      lastDate: widget.isBrithDate?DateTime.now(): DateTime(2050));

                  if(pickedDate != null){
                    String formattedDate = widget.ignoreBirthYear == "Y" ?   DateFormat("dd-MM").format(pickedDate) : DateFormat(_dateFormat ?? 'dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      widget.controller?.text = formattedDate; //set output date to TextField value.
                    });
                  }
                  },),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
      ],
    );
  }

  String _getFormattedDate(String text) {
    var inputFormat = DateFormat('MM-dd-yyyy');
    var date1 = inputFormat.parse(text);
    var outputFormat = DateFormat('dd-MM-yyyy');
    return outputFormat.format(date1);
  }
}