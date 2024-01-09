import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/cupertino.dart';

class SearchItemWidgetAccounts extends StatelessWidget{

  double _widthFactor;
  String? _text;

  SearchItemWidgetAccounts(this._widthFactor, this._text);

  @override
  Widget build(BuildContext context) {
    return
      Flexible(child: FractionallySizedBox(
        alignment: Alignment.center,
          widthFactor:_widthFactor ,
          child: Text(_text ?? "",style: AppStyle.customerTextBold,overflow: TextOverflow.ellipsis,)));
  }

}