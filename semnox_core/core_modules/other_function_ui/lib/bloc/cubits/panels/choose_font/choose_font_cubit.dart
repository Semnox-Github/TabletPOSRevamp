import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choose_font_state.dart';

class ChooseFontCubit extends Cubit<ChooseFontState> {
  ChooseFontCubit()
      : super(
            ChooseFontState()); // here inside ChooseFontState class,  some of the fields are already initialized

  void setInitialValues() {
    List<String> _listOfFontFamily = GoogleFonts.asMap().keys.toList();
    List<int> _listOfFontSizes = [
      8,
      9,
      10,
      11,
      12,
      14,
      16,
      18,
      20,
      22,
      24,
      26,
      28,
      30,
      32,
      48,
      72
    ];
    List<String> _listOfFontStyles = [
      "Style Stretch Weight",
      "Normal Normal Normal",
      "Italic Normal Normal",
      "Normal Normal Bold",
      "Italic Normal Bold",
    ];
    emit(state.copyWith(
        fontFamilyList: _listOfFontFamily, fontSizeList: _listOfFontSizes, fontStyleList: _listOfFontStyles));
  }

  void onSelectFontFamily(newState){
    emit(state.copyWith(selectedFontFamily: newState));
  }

  void onSelectFontStyle(newState){
    emit(state.copyWith(selectedFontStyle: newState));
  }

  void onSelectFontSize(newState){
    emit(state.copyWith(selectedFontSize: newState));
  }

  void resetValues() {
    emit(state.copyWith());
  }

  void clearAllState() {
    emit(ChooseFontState());
    setInitialValues();
  }
}
