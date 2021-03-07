import 'package:agrimatco/Constant/server.dart';

class UnitModel {
  int id;
  String name;
  String notes;
  String image;
  int userId;

  UnitModel({
    this.id,
    this.name,
    this.notes,
    this.image,
    this.userId,
  });

  UnitModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    notes = json['notes'];
    image = serverimage + json['image'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['notes'] = this.notes;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    return data;
  }
}

class UnitList {
  final List<UnitModel> catagory;

  UnitList(this.catagory);

  UnitList.fromJson(List<dynamic> dJson)
      : catagory = dJson.map((data) => UnitModel.fromJson(data)).toList();
}
