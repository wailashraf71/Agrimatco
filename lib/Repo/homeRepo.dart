import 'package:agrimatco/Constant/connect.dart';
import 'package:agrimatco/Model/UnitModel.dart';
import 'package:flutter/material.dart';

class HomeRepo with ChangeNotifier {
  List<UnitModel> unitlist = [];
  bool unitlistloding = false;

  getunitlists(BuildContext context) async {
    if (unitlist.length > 0) {
      unitlist.clear();
      getdata(context: context, name: "units").then((value) {
        unitlist.addAll(UnitList.fromJson(value).catagory);
        notifyListeners();
      });
      return;
    }
    unitlistloding = true;

    unitlist.clear();
    notifyListeners();
    getdata(context: context, name: "units").then((value) {
      unitlist.addAll(UnitList.fromJson(value).catagory);
      unitlistloding = false;
      notifyListeners();
    });
  }
}
