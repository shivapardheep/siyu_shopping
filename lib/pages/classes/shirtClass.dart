class ShirtClass {
  String? image;
  List<String>? size;
  int? price;
  String? name;
  String? brand;
  List<String>? colors;

  ShirtClass(
      {this.image, this.size, this.price, this.name, this.brand, this.colors});

  ShirtClass.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    size = json['size'].cast<String>();
    price = json['price'];
    name = json['name'];
    brand = json['brand'];
    colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['image'] = image;
    data['size'] = size;
    data['price'] = price;
    data['name'] = name;
    data['brand'] = brand;
    data['colors'] = colors;
    return data;
  }
}
