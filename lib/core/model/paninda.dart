class Paninda {
  String item;
  int price;
  String category;
  bool isFavorite;

  Paninda({this.item, this.price, this.category, this.isFavorite});

  Paninda.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    price = json['price'];
    category = json['category'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['price'] = this.price;
    data['category'] = this.category;
    data['isFavorite'] = this.isFavorite;

    return data;
  }
}
