class PrdouctModel {
  int id;
  String name;
  String price;
  List<String> images;
  String details;
  int unitId;

  PrdouctModel({
    this.id,
    this.name,
    this.price,
    this.images,
    this.details,
    this.unitId,
  });

  PrdouctModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    if (json['images'] != null) {
      images = new List<String>();
      json['images'].forEach((v) {
        images.add(v);
      });
    }
    details = json['details'];
    unitId = json['unit_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    if (this.images != null) {}
    data['details'] = this.details;
    data['unit_id'] = this.unitId;
    return data;
  }
}

class Prdouctslist {
  final List<PrdouctModel> catagory;

  Prdouctslist(this.catagory);

  Prdouctslist.fromJson(List<dynamic> dJson)
      : catagory = dJson.map((data) => PrdouctModel.fromJson(data)).toList();
}
