import 'package:file_picker/file_picker.dart';

class ProductRequestModel {
  int? id;
  String name;
  num price;
  String unitOfMeasure;
  String? description;
  PlatformFile? image;
  int categoryId;

  bool get isKg => unitOfMeasure == 'KG';

  ProductRequestModel({
    this.id,
    required this.name,
    required this.price,
    required this.unitOfMeasure,
    this.description,
    this.image,
    required this.categoryId,
  });

  factory ProductRequestModel.fromJson(Map<String, dynamic> json) =>
      ProductRequestModel(
        id: json['id'],
        name: json['name'],
        price: json['preco'],
        unitOfMeasure: json['unidade'],
        image: json['imagem'],
        categoryId: json['categoria_id'],
        description: json['descricao'],
      );

  Map<String, dynamic> toJson() => {
        'nome': name,
        'descricao': description,
        'preco': price,
        'unidade': unitOfMeasure,
        'categoria_id': categoryId,
        'posicao': 1,
      };
}
