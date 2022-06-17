import 'package:flutter/material.dart';

class ViewProvider extends ChangeNotifier {
  bool isGridView = false;

  void changeView() {
    isGridView = !isGridView;
    notifyListeners();
  }
}
