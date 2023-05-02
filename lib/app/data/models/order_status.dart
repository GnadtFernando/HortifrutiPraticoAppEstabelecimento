class OrderStatusModel {
  int id;
  String name;
  DateTime createAt;

  OrderStatusModel({
    required this.id,
    required this.name,
    required this.createAt,
  });

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusModel(
          id: json['status']['id'],
          name: json['status']['status'],
          createAt: DateTime.parse(json['created_at']));
}
