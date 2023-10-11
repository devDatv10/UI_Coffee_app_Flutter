class Tea{
  String name;
  String imagePath;
  String description;
  String price;
  String rating;

  Tea({required this.name, required this.imagePath, required this.description, required this.price, required this.rating});

  String get _name => name;
  String get _description => description;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
}

