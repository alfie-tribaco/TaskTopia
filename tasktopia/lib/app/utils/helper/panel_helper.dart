import 'package:flutter/material.dart';

class PanelHelper extends ChangeNotifier {
  int currentPage = 1;

  void changePage(int i) {
    currentPage = i;
    notifyListeners();
  }
}
