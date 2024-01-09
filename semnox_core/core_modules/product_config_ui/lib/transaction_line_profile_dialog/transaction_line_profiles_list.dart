import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_container_dto.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../AppColors.dart';

class TransactionLineProfilesList extends StatefulWidget {
  final Function(int value) onProfileIdSelected;
  final int transactionProfileId;
  final List<TransactionProfileContainerDTO> transactionProfileContainerDtoList;

  const TransactionLineProfilesList({
    Key? key,
    required this.transactionProfileId,
    required this.onProfileIdSelected,
    required this.transactionProfileContainerDtoList,
  }) : super(key: key);

  @override
  State<TransactionLineProfilesList> createState() => _TransactionLineProfilesListState();
}

class _TransactionLineProfilesListState extends State<TransactionLineProfilesList> {
  int _selectedProfileId = -1;
  SemnoxTheme? theme;

  @override
  void initState() {
    _selectedProfileId = widget.transactionProfileId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    var dataList = widget.transactionProfileContainerDtoList;

    return GridView.builder(
        itemCount: dataList.length,
        padding: dataList.length == 2
            ? EdgeInsets.only(
                left: SizeConfig.getWidth(80),
                top: SizeConfig.getHeight(20),
                right: SizeConfig.getWidth(90),
                bottom: SizeConfig.getWidth(20))
            : EdgeInsets.all(SizeConfig.getSize(0)),
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: dataList.length == 2 ? 2 : 3,
          childAspectRatio: (2 / 1),
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: SizeConfig.getWidth(16)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(SizeConfig.getSize(122), SizeConfig.getSize(72)),
                minimumSize: Size(SizeConfig.getSize(122), SizeConfig.getSize(72)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                ),
                backgroundColor: _selectedProfileId == dataList[index].transactionProfileId
                    ? theme?.button2BG1
                    : theme?.button1BG1,
              ),
              onPressed: () {
                setState(() {
                  _selectedProfileId = dataList[index].transactionProfileId;
                  widget.onProfileIdSelected(dataList[index].transactionProfileId);
                });
              },
              child: Text(
                dataList[index].profileName.toUpperCase(),
                style: GoogleFonts.robotoCondensed(
                    color: _selectedProfileId == dataList[index].transactionProfileId
                        ? theme?.primaryColor
                        : theme?.secondaryColor,
                    fontSize: SizeConfig.getFontSize(18),
                    fontWeight: FontWeight.w700),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
  }
}
