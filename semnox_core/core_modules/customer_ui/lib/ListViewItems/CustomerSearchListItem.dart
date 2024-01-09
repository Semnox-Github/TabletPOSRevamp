import 'package:customer_ui/widgets/SearchItemWidget.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class CustomerListItem extends StatefulWidget{

  int _selectedIndex = 0;
  int _index = 0;
  List<CustomerData?>? _data = [];
  final Function(int value) onChange;
  String? _dateFormat;
  String? fromPage;

  CustomerListItem({super.key, required int selectedIndex, required int index,List<CustomerData?>? data,required this.onChange,String? dateFormat,
  this.fromPage}){
    _selectedIndex = selectedIndex;
    _index = index;
    _data = data;
    _dateFormat = dateFormat;
  }

  @override
  State<CustomerListItem> createState() => _CustomerListItemState();
}

class _CustomerListItemState extends State<CustomerListItem> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      decoration: BoxDecoration(
          border:  (widget._selectedIndex == widget._index) ? Border.all(color: theme.secondaryColor!) : null,
          borderRadius: BorderRadius.circular(8),
          color: theme.tableRow1
      ),
      child: InkWell(
        onTap: () =>{
          setState(() {
            widget._selectedIndex = widget._index;
            widget.onChange(widget._index);
          })
        },
        child: Container(
          /*dense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),*/
          height: SizeConfig.getSize(68),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SearchItemWidget(0.5,widget._data?[widget._index]?.id.toString(),),
              SearchItemWidget(0.8,widget._data?[widget._index]?.firstName.toString()),
              SearchItemWidget(0.8,widget._data?[widget._index]?.lastName.toString()),
              SearchItemWidget(1,widget._data?[widget._index]?.phoneNumber.toString()),
              SearchItemWidget(2,widget._data?[widget._index]?.email.toString()),
              SearchItemWidget(1,widget._data?[widget._index]?.membershipId == -1 ? "" : widget._data?[widget._index]?.membershipId.toString()),
              Visibility(
                visible: widget.fromPage == "lookup" ? false : true,
                  child: SearchItemWidget(1,widget._data?[widget._index]?.cardNumber.toString())),
              SearchItemWidget(2,widget._data?[widget._index]?.creationDate == null ? "" : (widget._data?[widget._index]?.creationDate ?? "").startsWith('000') ? "":DateFormat(widget._dateFormat).format(DateTime.parse(widget._data?[widget._index]?.creationDate ?? "0001-01-01T00:00:00"))
                  .toString().toString()),
           ],
          ),

        ),
      ),
    );
  }

}