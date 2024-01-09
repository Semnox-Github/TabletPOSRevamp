import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class OtherFunctionItem extends StatelessWidget {
  final String ofItem;
  final Color? color;
  final bool isEnabled;
  const OtherFunctionItem({
    super.key,
    required this.ofItem,
    required this.isEnabled,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    late SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Padding(
      padding:  EdgeInsets.all(SizeConfig.getSize(4)),
      child: Container(
        constraints:  BoxConstraints(minHeight: 0, maxHeight: SizeConfig.getSize(400)),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: theme.secondaryColor!
                    .withOpacity(0.3),
                spreadRadius:SizeConfig.getSize(0.2),
                blurRadius: SizeConfig.getSize(0.2),
                offset:  Offset(0,
                    SizeConfig.getSize(2)), // changes position of shadow
              ),
            ],
            color: theme.tableRow1,
            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))
        ),
        child: Opacity(
          opacity: isEnabled ? 1 : 0.4,
          child: Padding(
            padding:  EdgeInsets.all(SizeConfig.getSize(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    ofItem,
                    style:  theme.heading5!.copyWith( fontSize: SizeConfig.getSize(18),
                      fontWeight: FontWeight.bold,),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
