class ProductModel {
  int id;
  String name;
  num price;
  String unitOfMeasure;
  String? description;
  String? image;
  int categoryId;

  bool get isKg => unitOfMeasure == 'KG';

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.unitOfMeasure,
    this.image,
    this.description,
    required this.categoryId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['nome'],
        price: json['preco'],
        unitOfMeasure: json['unidade'],
        image: json['imagem'],
        description: json['descricao'],
        categoryId: json['categoria_id'],
      );
}
