import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class AttendanceDropDown extends StatelessWidget {
  final double width;
  final List<String>? dropDown;
  const AttendanceDropDown({super.key, required this.width, this.dropDown});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.tableRow1,
      ),
      width: width * 0.4,
      height: SizeConfig.getFontSize(55),
      child: DropdownButtonFormField<String>(
        style: TextStyle(
            fontSize: SizeConfig.getFontSize(22), color: theme.primaryOpposite),
        value: dropDown?.isEmpty == true ? '' : dropDown?.first,
        items: dropDown!.map<DropdownMenuItem<String>>((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (String? value) {},
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          contentPadding: EdgeInsets.only(left: 8),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
