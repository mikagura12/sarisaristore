class Paninda {
  String item;
  int price;
  String category;
  bool isFavorite;
  String image;
  Paninda({this.item, this.price, this.category, this.isFavorite, this.image});

  Paninda.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    price = json['price'];
    category = json['category'];
    isFavorite = json['isFavorite'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['price'] = this.price;
    data['category'] = this.category;
    data['isFavorite'] = this.isFavorite;
    data['image'] = this.image;
    return data;
  }
}
