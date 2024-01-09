import 'package:customer_data/models/contact_dto.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:intl/intl.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/size_config.dart';

class ContactItem extends StatefulWidget{

  int selectedIndex = 0;
  int index = 0;
  final Function(int value) onChange;
  ContactDTO? contactDTO;
  VoidCallback? onPress;
  bool? isChecked = true;
  bool? isActive = true;

  ContactItem({required this.selectedIndex, required this.index,this.contactDTO,required this.onChange,this.onPress,
    this.isChecked,this.isActive});

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  ParafaitDefaultContainerDTO? _dateObject;
  String? _dateFormat;
  ConfigurationResponse? _config;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var type = widget.contactDTO?.contactType;
    bool _isChecked = widget.contactDTO?.isActive ?? true;
    return Visibility(
      visible: (widget.isActive == widget.isChecked) ? true : false,
      child: Container(
          decoration: BoxDecoration(
            //border:  (widget.selectedIndex == widget.index) ? Border.all(color: Colors.black) : null,
              borderRadius: BorderRadius.circular(8),
              color: theme.tableRow1
          ),
          margin: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
          child:ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title : Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(_getTypeName(type!), style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),maxLines: 1,),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(widget.contactDTO?.attribute1 ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),maxLines: 1,),
                  ),
                ),
                /*Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(widget.contactDTO?.creationDate == null ? "" : DateFormat(_dateFormat).format(
                    DateTime.parse(widget.contactDTO?.creationDate ?? '0001-01-01T00:00:00')), style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor),maxLines: 1,),
              ),
            ),*/
                //const Spacer(),
                Expanded(
                  flex: 5,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Checkbox(value:  _isChecked, onChanged: (bool? value){
                      setState(() {
                        _isChecked = value!;

                      });
                    },
                      checkColor: theme.secondaryColor,
                      activeColor: theme.backGroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                      ),),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(onPressed:widget.onPress, icon: Image.asset("assets/ic_edit.png", color : theme.secondaryColor)))
              ],
            ),
            onTap: (){
              setState(() {
                widget.selectedIndex = widget.index;
                widget.onChange(widget.index);
              });
            },
          )
      ),
    );
  }

  _getTypeName(int type){
    return type == 1 ?
    MessagesProvider.get('Email') :
    type == 2 ?
    MessagesProvider.get('Phone') :
    type == 3 ?
    MessagesProvider.get('Facebook') :
    type == 4 ?
    MessagesProvider.get('Twitter'):
    MessagesProvider.get('Wechat');
  }

  Future getConfigurations(BuildContext context) async {
    //'dd-MMM-yyyy, hh:mm:ss a'
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _config = await masterDataBl.getConfigurations();
    // setState(() {
    _dateObject = _config?.data?.parafaitDefaultContainerDtoList
        .firstWhere(
            (element) => element.defaultValueName == 'DATE_FORMAT');
    _dateFormat = _dateObject?.defaultValue;
    //  });
  }
}
