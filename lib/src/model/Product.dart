class MonitorModel {
  MonitorModel(this.id, this.unitName, this.customerName, this.location,
      this.dateTime, this.totalRunHour, this.lastDayRunHour);
  var id = "";
  var unitName = "";
  var customerName = "";
  var location = "";
  var dateTime = "";
  var totalRunHour = "";
  var lastDayRunHour = "";
}

class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
    );
  }
}