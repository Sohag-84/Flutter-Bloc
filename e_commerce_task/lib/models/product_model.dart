class ProductModel {
  ProductModel({
    required this.id,
    required this.code,
    required this.name,
    required this.unitId,
    required this.price,
    required this.secondaryPrice,
    required this.sku,
    required this.packSize,
    required this.stock,
    required this.type,
    required this.categoryId,
    required this.notes,
    required this.vat,
    required this.status,
    required this.stdPriceAccounts,
    required this.vatValueAccounts,
    required this.sdvInv,
    required this.sdInv,
    required this.vatInv,
    required this.unitSupply,
    required this.unitSupplyQty,
    required this.mushok64Show,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.tradeOfferInputQty,
    required this.tradeOfferQty,
    required this.unitName,
    required this.unitQty,
    required this.categoryName,
    required this.stockQty,
  });

  final int? id;
  final String? code;
  final String? name;
  final int? unitId;
  final String? price;
  final String? secondaryPrice;
  final String? sku;
  final String? packSize;
  final String? stock;
  final String? type;
  final int? categoryId;
  final String? notes;
  final String? vat;
  final String? status;
  final dynamic stdPriceAccounts;
  final dynamic vatValueAccounts;
  final String? sdvInv;
  final String? sdInv;
  final String? vatInv;
  final int? unitSupply;
  final String? unitSupplyQty;
  final int? mushok64Show;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final dynamic tradeOfferInputQty;
  final dynamic tradeOfferQty;
  final String? unitName;
  final String? unitQty;
  final String? categoryName;
  final String? stockQty;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      code: json["code"],
      name: json["name"],
      unitId: json["unit_id"],
      price: json["price"],
      secondaryPrice: json["secondary_price"],
      sku: json["sku"],
      packSize: json["pack_size"],
      stock: json["stock"],
      type: json["type"],
      categoryId: json["category_id"],
      notes: json["notes"],
      vat: json["vat"],
      status: json["status"],
      stdPriceAccounts: json["std_price_accounts"],
      vatValueAccounts: json["vat_value_accounts"],
      sdvInv: json["sdv_inv"],
      sdInv: json["sd_inv"],
      vatInv: json["vat_inv"],
      unitSupply: json["unit_supply"],
      unitSupplyQty: json["unit_supply_qty"],
      mushok64Show: json["mushok_6_4_show"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      tradeOfferInputQty: json["tradeOfferInputQty"],
      tradeOfferQty: json["tradeOfferQty"],
      unitName: json["unit_name"],
      unitQty: json["unit_qty"],
      categoryName: json["category_name"],
      stockQty: json["stockQty"],
    );
  }
}
