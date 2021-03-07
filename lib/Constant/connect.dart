import 'dart:convert';

import 'package:agrimatco/Constant/diohelpe.dart';
import 'package:agrimatco/Constant/server.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

Future getdata({
  context,
  name,
}) async {
  try {
    final res = await DioHelper.getDio().get("$server/" + name,
        options: buildCacheOptions(
          Duration(days: 2),
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
    return tempdata;
  } catch (e) {
    print(e);
  }
}

Future postdata({context, name, data, token}) async {
  try {
    final res = await http.post("$server/$name",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(data));
    print(res.body);
    return res.statusCode;
  } catch (e) {
    print(e);
    Toast.show("نأسف جدا حدث خطأ ما ", context, duration: 2);
  }
}

Future getdataauth({context, name, token}) async {
  try {
    final res = await DioHelper.getDio().get("$server/" + name,
        options: buildCacheOptions(
          Duration(days: 2),
          maxStale: Duration(days: 1),
          forceRefresh: true,
          options: dio.Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $token"
            },
          ),
        ));

    var tempdata = (res.data['data']);
    return tempdata;
  } catch (e) {
    print(e);
  }
}
