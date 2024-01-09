import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class SearchResultHeaderView extends StatefulWidget {
  const SearchResultHeaderView(
      {super.key, required this.hasCourse, required this.isAllSelected, required this.isCheckedCallback});

  final bool hasCourse;
  final bool isAllSelected;
  final Function(bool isChecked) isCheckedCallback;

  @override
  State<StatefulWidget> createState() => _SearchResultHeaderViewState();
}

class _SearchResultHeaderViewState extends State<SearchResultHeaderView> {
  final isChecked = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    isChecked.value = widget.isAllSelected;
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.getWidth(26), right: SizeConfig.getWidth(7)),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                isChecked.value = !isChecked.value;
                widget.isCheckedCallback(isChecked.value);
              },
              child: Container(
                height: SizeConfig.getSize(30),
                width: SizeConfig.getSize(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(6))),
                  border: Border.all(width: SizeConfig.getWidth(1), color: theme.secondaryColor!),
                  color: theme.transparentColor,
                ),
                child: ValueListenableBuilder<bool>(
                  valueListenable: isChecked,
                  builder: (context, value, _) {
                    return (value)
                        ? Image.asset(
                            "assets/check.png",
                            color: theme.secondaryColor,
                            width: SizeConfig.getSize(30),
                            height: SizeConfig.getSize(30),
                          )
                        : const SizedBox();
                  },
                ),
              )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
              child: Text(
                MessagesProvider.get("Seat Name"),
                style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(10)),
              child: Text(
                MessagesProvider.get("Seat Number"),
                style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
              ),
            ),
          ),
          widget.hasCourse
              ? Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.getWidth(10)),
                    child: Text(
                      MessagesProvider.get("Course"),
                      style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
                    ),
                  ),
                )
              : const SizedBox(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(10)),
              child: Text(
                MessagesProvider.get("Product"),
                style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(10)),
              child: Text(
                MessagesProvider.get("Quantity"),
                style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(10)),
              child: Text(
                MessagesProvider.get("Additional Info"),
                style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
