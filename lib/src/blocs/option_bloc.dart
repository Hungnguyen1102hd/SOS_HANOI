import 'dart:async';

import 'package:sos_hanoi/src/config/option_utils.dart';
import 'package:sos_hanoi/src/model/option_item.dart';

class OptionPickupBloc {
  var _pickupController = new StreamController();
  var optionList = OptionUtils.getOptionList();
  get stream => _pickupController.stream;

  var currentSelected = 0;

  void selectItem(int index) {
    currentSelected = index;
    _pickupController.sink.add(currentSelected);
  }

  bool isSelected(int index) {
    return index == currentSelected;
  }

  OptionItem getCurrentList() {
    return optionList.elementAt(currentSelected);
  }

  void dispose() {
    _pickupController.close();
  }
}