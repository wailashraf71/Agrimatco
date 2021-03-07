class UserModel {
  int id;
  String name;
  String email;
  String usertype;
  String isactive;
  String unitid;

  UserModel({
    this.id,
    this.isactive,
    this.usertype,
    this.name,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isactive = json['isactive'];
    name = json['name'];
    usertype = json['user_type'];
    unitid = json['unit_id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['usertype'] = this.usertype;
    data['email'] = this.email;
    data['isactive'] = this.isactive;

    return data;
  }
}
