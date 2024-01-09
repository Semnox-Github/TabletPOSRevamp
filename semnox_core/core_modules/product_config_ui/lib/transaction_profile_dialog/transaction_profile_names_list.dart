import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_container_dto.dart';
import 'package:widgets_library/utils/size_config.dart';

class TransactionProfileNamesList extends StatefulWidget {
  final List<TransactionProfileContainerDTO>? transactionProfiles;
  final Function(int profileId,bool? remarksMandatory) onProfileIdSelected;
  final int transactionProfileId;

  const TransactionProfileNamesList({
    Key? key,
    this.transactionProfiles,
    required this.transactionProfileId,
    required this.onProfileIdSelected,
  }) : super(key: key);

  @override
  State<TransactionProfileNamesList> createState() => _TransactionProfileNamesListState();
}

class _TransactionProfileNamesListState extends State<TransactionProfileNamesList> {
  int selectedCard = -1;
  int preselectedCard = -1;
  SemnoxTheme? theme;

  @override
  void initState() {
    super.initState();
    selectedCard = widget.transactionProfiles
        ?.indexWhere((element) => element.transactionProfileId == widget.transactionProfileId) ?? -1;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    var dataList = widget.transactionProfiles ??[];

    return GridView.builder(
        padding: dataList.length == 2
            ? EdgeInsets.only(
                left: SizeConfig.getWidth(80),
                top: SizeConfig.getHeight(20),
                right: SizeConfig.getWidth(90),
                bottom: SizeConfig.getWidth(20))
            : EdgeInsets.all(SizeConfig.getSize(0)),
        itemCount: dataList.length,
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:dataList.length == 2 ? 2: 3,
          childAspectRatio:(2 / 1),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: SizeConfig.getWidth(16)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(SizeConfig.getSize(122),SizeConfig.getSize(72)),
                minimumSize:  Size(SizeConfig.getSize(122),SizeConfig.getSize(72)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                ),
                backgroundColor: selectedCard == index ? theme?.button2BG1 : theme?.button1BG1,
              ),
              onPressed: () {
                setState(() {
                  selectedCard = index;
                  widget.onProfileIdSelected(dataList[index].transactionProfileId,dataList[index].transactionRemarksMandatory ?? false);
                });
              },
              child: Text(
                dataList[index].profileName.toUpperCase(),
                style: GoogleFonts.robotoCondensed(
                    color: selectedCard == index ? theme?.primaryColor : theme?.secondaryColor,
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