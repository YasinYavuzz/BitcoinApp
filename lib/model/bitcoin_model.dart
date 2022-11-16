class BitcoinModel {
  String? name;
  String? imageUrl;
  double? price;
 

  BitcoinModel({
       this.name,
       this.imageUrl,
       this.price,
  });

  factory BitcoinModel.fromJson(Map<String, dynamic> json) {
    return BitcoinModel(
        name: json['name'],
        imageUrl: json['image'],
        price: json['current_price'],
    );
  }
}
