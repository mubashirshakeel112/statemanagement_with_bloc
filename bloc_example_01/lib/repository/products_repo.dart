import 'package:bloc_example_01/domain/models/products_model.dart';
import 'package:bloc_example_01/services/products_service.dart';

class ProductsRepository extends ProductsService{
  final WCProductsService _wcProductsService = WCProductsService();
  @override
  Future<List<ProductsModel>> getProducts() async{
    return _wcProductsService.getProducts();
  }

  @override
  Future<ProductsModel> getProductById(int id) async{
    return _wcProductsService.getProductById(id);
  }
}