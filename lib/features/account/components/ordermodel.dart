// class Items {
//   String productName;
//   int quantity;
//   double unitPrice;
//   String id;

//   Items({
//     required this.productName,
//     required this.quantity,
//     required this.unitPrice,
//     required this.id,
//   });

//   // Factory constructor for creating a Product instance from a map
//   factory Items.fromMap(Map<String, dynamic> map) {
//     return Items(
//       productName: map['productName'],
//       quantity: map['quantity'],
//       unitPrice: map['unitPrice'].toDouble(),
//       id: map['_id'],
//     );
//   }

//   // Method for converting a Product instance to a map
//   Map<String, dynamic> toMap() {
//     return {
//       'productName': productName,
//       'quantity': quantity,
//       'unitPrice': unitPrice,
//       '_id': id,
//     };
//   }
// }

class Product {
  String productName;
  int quantity;
  double unitPrice;
  String id;

  Product({
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.id,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productName: map['productName'],
      quantity: map['quantity'],
      unitPrice: map['unitPrice'].toDouble(),
      id: map['_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'quantity': quantity,
      'unitPrice': unitPrice,
      '_id': id,
    };
  }
}

class Order {
  String id;
  List<Product> products;
  double totalPrice;
  String address;
  String userId;
  DateTime orderedAt;
  int status;
  int version;

  Order({
    required this.id,
    required this.products,
    required this.totalPrice,
    required this.address,
    required this.userId,
    required this.orderedAt,
    required this.status,
    required this.version,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'],
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
      totalPrice: map['totalPrice'].toDouble(),
      address: map['address'],
      userId: map['userId'],
      orderedAt: DateTime.parse(map['orderedAt']),
      status: map['status'],
      version: map['__v'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'totalPrice': totalPrice,
      'address': address,
      'userId': userId,
      'orderedAt': orderedAt.toIso8601String(),
      'status': status,
      '__v': version,
    };
  }
}
