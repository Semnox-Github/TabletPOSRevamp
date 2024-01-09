import  'package:flutter/material.dart';

import  '../../semnox_core.dart';
import 'package:logs_data/logger.dart';

class SemnoxSlider extends StatelessWidget {
  const SemnoxSlider(
      {Key? key, required this.properties, this.isActive = true})
      : super(key: key);
  final SemnoxSliderProperties properties;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: Theme.of(context).sliderTheme.copyWith(
        inactiveTrackColor: SemnoxConstantColor.inactiveCardColor(context)
      ),
      child: StreamBuilder<double>(
        stream: properties.valueChangeStream,
        builder: (context, snapshot) {
          Log.v("${snapshot.data}");
          return Slider(
              value: properties.value,
              
              activeColor: SemnoxConstantColor.primaryColor(context),
              onChanged: isActive
                  ? properties.onChange
                  : null,
                  );
        }
      ),
    );
  }
}
