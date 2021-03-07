import 'package:agrimatco/Constant/diohelpe.dart';
import 'package:agrimatco/Constant/server.dart';
import 'package:agrimatco/Model/PrdouctModel.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

class ProductRepo with ChangeNotifier {
  bool lodingproducts = true;
  bool hasmoreproducts = true;
  List<PrdouctModel> products = [];

  getproductofunit(context, catid, page) async {
    if (page == 1) {
      products.clear();
      hasmoreproducts = true;
    }
    lodingproducts = true;
    notifyListeners();
    var url = "$server/units/$catid?page=$page";
    final res = await DioHelper.getDio().get(url,
        options: buildCacheOptions(
          Duration(seconds: 2),
          maxStale: Duration(days: 1),
          forceRefresh: true,
          options: dio.Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          ),
        ));

    var tempdata = (res.data['data']);
    products.addAll(Prdouctslist.fromJson(tempdata).catagory);

    if (tempdata['data'].length == 0) {
      hasmoreproducts = false;
    }

    if (products.length == 0) {
      hasmoreproducts = false;
    }

    lodingproducts = false;
    notifyListeners();
  }
}
