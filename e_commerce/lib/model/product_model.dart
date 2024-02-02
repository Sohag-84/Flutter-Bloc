class ProductModel {
  ProductModel({
    required this.isDiscount,
    required this.isBogo,
    required this.id,
    required this.sku,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.isVisible,
    required this.price,
    required this.isPlastic,
    required this.weight,
    required this.quantity,
    required this.category,
    required this.image,
    required this.updatedAt,
    required this.plasticType,
    required this.precedence,
    required this.productWeight,
    required this.employee,
    required this.brand,
    required this.subcategory,
    required this.discountedAmount,
    required this.createdAt,
    required this.v,
    required this.discountType,
    required this.discountAmount,
    this.proQuantity = 1,
    this.isBtnClicked = false,
  });

  final bool? isDiscount;
  final bool? isBogo;
  final String? id;
  final int? sku;
  final String? name;
  final String? description;
  final String? shortDescription;
  final bool? isVisible;
  final int? price;
  final bool? isPlastic;
  final int? weight;
  final int? quantity;
  final Category? category;
  final String? image;
  final DateTime? updatedAt;
  final Brand? plasticType;
  final int? precedence;
  final String? productWeight;
  final String? employee;
  final Brand? brand;
  final Category? subcategory;
  final dynamic discountedAmount;
  final DateTime? createdAt;
  final int? v;
  final String? discountType;
  final int? discountAmount;
  int proQuantity = 1;
  bool isBtnClicked;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      isDiscount: json["isDiscount"],
      isBogo: json["isBogo"],
      id: json["_id"],
      sku: json["sku"],
      name: json["name"],
      description: json["description"],
      shortDescription: json["shortDescription"],
      isVisible: json["isVisible"],
      price: json["price"],
      isPlastic: json["isPlastic"],
      weight: json["weight"],
      quantity: json["quantity"],
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      image: json["image"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      plasticType: json["plasticType"] == null
          ? null
          : Brand.fromJson(json["plasticType"]),
      precedence: json["precedence"],
      productWeight: json["productWeight"],
      employee: json["employee"],
      brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
      subcategory: json["subcategory"] == null
          ? null
          : Category.fromJson(json["subcategory"]),
      discountedAmount: json["discountedAmount"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      v: json["__v"],
      discountType: json["discountType"],
      discountAmount: json["discountAmount"],
    );
  }
}

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.image,
    required this.v,
    required this.point,
  });

  final String? id;
  final String? name;
  final String? image;
  final int? v;
  final int? point;

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      v: json["__v"],
      point: json["point"],
    );
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.precedence,
    required this.image,
    required this.isActive,
    required this.isDiscount,
    required this.v,
    required this.category,
  });

  final String? id;
  final String? name;
  final int? precedence;
  final String? image;
  final bool? isActive;
  final bool? isDiscount;
  final int? v;
  final String? category;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      name: json["name"],
      precedence: json["precedence"],
      image: json["image"],
      isActive: json["isActive"],
      isDiscount: json["isDiscount"],
      v: json["__v"],
      category: json["category"],
    );
  }
}
