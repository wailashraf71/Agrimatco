import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingUnit() {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.withOpacity(0.1),
              blurRadius: 7,
              spreadRadius: -7,
              offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                child: Center(
                    child: Text(
                  "جاري التحميل",
                ))),
          ),
          Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}
