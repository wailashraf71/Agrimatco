import 'dart:convert';

import 'package:agrimatco/Constant/server.dart';
import 'package:agrimatco/Model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class UserRepo with ChangeNotifier {
  String token;
  UserModel userloggedin = new UserModel();

  loaduserinfo(UserModel userModel) {
    userloggedin = userModel;
    print("gs" + userloggedin.email);
    notifyListeners();
  }

  bool lodinglogin = false;

  login({email, context, password}) async {
    print('start');
    print(password);
    lodinglogin = true;
    notifyListeners();
    try {
      var data = {
        "email": email,
        "password": password,
      };
      final response = await http.post("$server/login",
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode(data));
      var json = jsonDecode(response.body);
      if (json["error"] == "UnAuthorised") {
        Toast.show("كلمة المرور غير صحيحة ", context, duration: 2);
        lodinglogin = false;

        notifyListeners();
      } else {
        token = json['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print(json["user"]);
        prefs.setString("userdata", jsonEncode(json["user"]));
        await prefs.setString("token", token);
        await prefs.setString("id", json["user"]["id"].toString());
        print(json["user"].toString());

        // UserModel userModal = UserModel.fromJson(json["info"]);
        // await loaduserinfo(userModal);
        // if (json["info"]["usertype"] == "worker") {
        //   Get.offAll(App(
        //     serviceProvider: true,
        //   ));
        // } else {
        //   Get.offAll(App());
        // }
      }

      lodinglogin = false;
      notifyListeners();

      // return Post.fromJson(json.decode(response.body));

    } catch (e) {
      lodinglogin = false;

      notifyListeners();

      Toast.show("نأسف جدا حدث خطأ ما ", context, duration: 2);
      print(e);
    }
  }
}
