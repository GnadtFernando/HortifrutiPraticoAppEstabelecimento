class ShippingByCityModel {
  int id;
  String name;
  String cost;

  ShippingByCityModel({
    required this.id,
    required this.name,
    required this.cost,
  });

  factory ShippingByCityModel.fromJson(Map<String, dynamic> json) =>
      ShippingByCityModel(
        id: json['id'],
        name: json['cidade'],
        cost: json['custo_entrega'],
      );
}
