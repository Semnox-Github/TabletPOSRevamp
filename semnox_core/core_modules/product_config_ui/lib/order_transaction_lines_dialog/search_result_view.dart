import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'package:widgets_library/utils/size_config.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView(
      {super.key,
      required this.transactionLineGroup,
      required this.isSelected,
      required this.hasCourse,
      required this.isCheckedCallback});

  final TransactionLinesGroup transactionLineGroup;
  final bool isSelected;
  final bool hasCourse;
  final Function(bool isChecked) isCheckedCallback;

  @override
  State<StatefulWidget> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      decoration: BoxDecoration(
        color: theme.tableRow1,
        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        border: Border.all(
            width: SizeConfig.getWidth(1),
            color: widget.isSelected ? theme.secondaryColor! : theme.primaryColor!),
      ),
      margin: EdgeInsets.only(
        left: SizeConfig.getWidth(22),
        top: SizeConfig.getHeight(7),
        right: SizeConfig.getHeight(7)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                widget.isCheckedCallback(!widget.isSelected);
              },
              child: Container(
                  height: SizeConfig.getSize(30),
                  width: SizeConfig.getSize(30),
                  margin: EdgeInsets.all(SizeConfig.getSize(4)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(6))),
                    border: Border.all(width: SizeConfig.getWidth(1), color:theme.secondaryColor!),
                  ),
                  child: widget.isSelected
                      ? Center(
                          child: Image.asset(
                            "assets/ic_check.png",
                            color: theme.secondaryColor,
                            width: SizeConfig.getSize(30),
                            height: SizeConfig.getSize(30),
                          ),
                        )
                      : const SizedBox())),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(16)),
              child: Text(
                widget.transactionLineGroup.seatName,
                style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(6)),
              child: Text(
                widget.transactionLineGroup.seatNumber.toString(),
                style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          widget.hasCourse
              ? Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.getWidth(6)),
                    child: Text(
                      widget.transactionLineGroup.courseName,
                      style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                )
              : SizedBox(width: SizeConfig.getWidth(0)),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(6)),
              child: Text(
                widget.transactionLineGroup.productName,
                style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(6)),
              child: Text(
                widget.transactionLineGroup.transactionLines.length.toString(),
                style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(6)),
              child: Text(
                widget.transactionLineGroup.remarks,
                style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
