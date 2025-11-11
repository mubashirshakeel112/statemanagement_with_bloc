import 'dart:convert';

import 'package:bloc_example_01/constants/endpoints.dart';
import 'package:bloc_example_01/domain/models/products_model.dart';
import 'package:bloc_example_01/extension.dart';
import 'package:bloc_example_01/infrastructure/api_exception.dart';
import 'package:http/http.dart' as http;

abstract class ProductsService {
  Future<List<ProductsModel>> getProducts();

  Future<ProductsModel> getProductById(int id);
}

class WCProductsService extends ProductsService {
  @override
  Future<List<ProductsModel>> getProducts() async {
    try {
      Uri endpoint = Uri.parse(Endpoints.products);
      http.Response response = await http.get(endpoint);
      if (response.isApiSuccessful) {
        return productsModelFromJson(response.body);
      } else {
        throw ApiException('Get', response.statusCode, response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsModel> getProductById(int id) async {
    try {
      Uri endpoint = Uri.parse('${Endpoints.products}$id');
      http.Response response = await http.get(endpoint);
      if (response.isApiSuccessful) {
        return ProductsModel.fromJson(jsonDecode(response.body));
      } else {
        throw ApiException('Get', response.statusCode, response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
