import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

class NewCustomerTitle extends StatelessWidget {
  final String _title;

  const NewCustomerTitle(this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: PhysicalModel(
        elevation: 1.0,
        color: AppColors.customerBackgroundColor,
        child: Container(
          width: double.infinity,
          color: theme.button1BG1,
          //margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(10.0),
          child: Text(
            _title,
            style: AppStyle.customerTitleBlackText
                .copyWith(color: theme.primaryOpposite),
          ),
        ),
      ),
    );
  }
}
