import 'dart:convert';

import 'package:app_painel_hortifruti_pratico/app/core/errors/exception_handlers.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/category_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/city.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/order.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/order_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/product_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/user.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/user_address_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/user_login_response.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/user_profile_request.dart';
import 'package:app_painel_hortifruti_pratico/app/data/provider/base_url.dart';
import 'package:app_painel_hortifruti_pratico/app/data/services/storage/service.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class Api extends GetxService {
  final _baseUrl = Baseurl.webdevhost;
  late Dio _dio;

  @override
  void onInit() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: const Duration(seconds: 16),
        connectTimeout: const Duration(seconds: 16),
        sendTimeout: const Duration(seconds: 16),
      ),
    );

    _dio.interceptors.add(AppInterceptors(_dio));

    super.onInit();
  }

  Future<List<CityModel>> getCities() async {
    var response = await _dio.get('cidades');

    List<CityModel> data = [];
    for (var city in response.data) {
      data.add(CityModel.fromJson(city));
    }

    return data;
  }

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    var response = await _dio.post('login', data: jsonEncode(data));

    return UserLoginResponseModel.fromJson(response.data);
  }

  Future<UserModel> register(UserProfileRequestModel data) async {
    var response = await _dio.post('cliente/cadastro', data: jsonEncode(data));

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> getUser() async {
    var response = await _dio.get('auth/me');

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> putUser(UserProfileRequestModel data) async {
    var response = await _dio.put('cliente', data: jsonEncode(data));

    return UserModel.fromJson(response.data);
  }

  Future<List<AddressModel>> getUserAddresses() async {
    var response = await _dio.get('enderecos');

    List<AddressModel> data = [];
    for (var address in response.data) {
      data.add(AddressModel.fromJson(address));
    }

    return data;
  }

  Future<void> postAddress(UserAddressRequestModel data) async {
    await _dio.post('enderecos', data: jsonEncode(data));
  }

  Future<void> putAddress(UserAddressRequestModel data) async {
    await _dio.put('enderecos/${data.id}', data: jsonEncode(data));
  }

  Future<void> deleteAddress(int id) async {
    await _dio.delete('enderecos/$id');
  }

  Future<List<StoreModel>> getStores(int cityId) async {
    var response = await _dio.get('cidades/$cityId/estabelecimentos');

    List<StoreModel> data = [];
    for (var store in response.data) {
      data.add(StoreModel.fromJson(store));
    }

    return data;
  }

  Future<StoreModel> getStore(int id) async {
    var response = await _dio.get('estabelecimentos/$id');

    return StoreModel.fromJson(response.data);
  }

  Future<List<CategoryModel>> getCategories() async {
    var response = await _dio.get('estabelecimento/categorias');

    List<CategoryModel> data = [];
    for (var order in response.data) {
      data.add(CategoryModel.fromJson(order));
    }

    return data;
  }

  Future<CategoryModel> postCategory(CategoryRequestModel data) async {
    var response =
        await _dio.get('estabelecimento/categorias', data: jsonEncode(data));

    return CategoryModel.fromJson(response.data);
  }

  Future<CategoryModel> putCategory(CategoryRequestModel data) async {
    var response = await _dio.put(
      'estabelecimento/categorias/${data.id}',
      data: jsonEncode(data),
    );

    return CategoryModel.fromJson(response.data);
  }

  Future<void> deleteCategory(int categoryId) async {
    await _dio.delete('estabelecimento/categorias/$categoryId');
  }

  Future<ProductModel> postProduct(ProductRequestModel data) async {
    var formData = FormData.fromMap(data.toJson());
    var image = data.image;

    if (image != null) {
      formData.files.add(
        MapEntry(
          'imagem',
          MultipartFile.fromBytes(image.bytes!, filename: image.name),
        ),
      );
    }

    var response = await _dio.post('estabelecimento/produtos', data: formData);
    return ProductModel.fromJson(response.data);
  }

  Future<ProductModel> putProduct(ProductRequestModel data) async {
    var formData = FormData.fromMap(data.toJson());
    var image = data.image;

    if (image != null) {
      formData.files.add(
        MapEntry(
          'imagem',
          MultipartFile.fromBytes(image.bytes!, filename: image.name),
        ),
      );
    }

    var response =
        await _dio.put('estabelecimento/produtos/${data.id}', data: formData);
    return ProductModel.fromJson(response.data);
  }

  Future<void> deleteProductImage(int productId) async {
    await _dio.delete('estabelecimento/produtos/$productId/imagem');
  }

  Future<List<ProductModel>> getProducts(int categoryId) async {
    var response =
        await _dio.get('estabelecimento/produtos?categoria_id=$categoryId');

    List<ProductModel> data = [];
    for (var order in response.data) {
      data.add(ProductModel.fromJson(order));
    }

    return data;
  }

  // PEDIDOS
  Future postOrder(OrderRequestModel data) async {
    await _dio.post('pedidos', data: jsonEncode(data));
  }

  Future<void> postOrderStatus(String id, int statusId) async {
    await _dio.post(
      'pedidos/$id/statuses',
      data: jsonEncode(
        {
          'status_id': statusId,
        },
      ),
    );
  }

  Future<List<OrderModel>> getOrders() async {
    var response = await _dio.get('estabelecimento/pedidos');

    List<OrderModel> data = [];
    for (var order in response.data) {
      data.add(OrderModel.fromJson(order));
    }

    return data;
  }

  Future<OrderModel> getOrder(String id) async {
    var response = await _dio.get('pedidos/$id');

    return OrderModel.fromJson(response.data);
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  final _storageService = Get.find<StorageService>();

  AppInterceptors(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final acessToken = _storageService.token;

    if (acessToken != null) {
      options.headers['Authorization'] = 'Bearer $acessToken';
    }
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadLineExceededException(err.requestOptions);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw NotFoundException(err.requestOptions);
          case 404:
            throw ConflictException(err.requestOptions);
          case 422:
            throw UnprocessableEntity(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
      case DioErrorType.badCertificate:
        throw NoInternetConnectionException(err.requestOptions);
      case DioErrorType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
      default:
        throw BadRequestException(err.requestOptions);
    }
  }
}
