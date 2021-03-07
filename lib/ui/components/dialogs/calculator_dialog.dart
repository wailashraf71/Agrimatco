import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:get/get.dart';

///Todo: fix
Future calculatorDialog({BuildContext context}) {
  Get.back();
  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Material(
            child: Container(
              height: MediaQuery.of(context).size.width < 600
                  ? MediaQuery.of(context).size.height * 0.7
                  : MediaQuery.of(context).size.height,
              // child: SimpleCalculator(
              //   theme: CalculatorThemeData(
              //       operatorColor: Theme.of(context).accentColor,
              //       operatorStyle: TextStyle(color: Colors.white, fontSize: 24),
              //       commandColor: Colors.blueGrey[50],
              //       numColor: Colors.grey[100],
              //       borderColor: Colors.black.withOpacity(0.1)),
              // ),
            ),
          ),
        );
      });
}
