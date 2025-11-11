import 'package:bloc_example_01/domain/models/products_model.dart';
import 'package:equatable/equatable.dart';

// abstract class ProductsState extends Equatable{
//   @override
//   List<Object?> get props => [];
// }
//
// class ProductsInitialState extends ProductsState {}
// class ProductsLoadingState extends ProductsState {}
// class ProductsLoadedState extends ProductsState {
//   final List<ProductsModel> products;
//   ProductsLoadedState(this.products);
//
//   @override
//   List<Object?> get props => [products];
// }
// class ProductsErrorState extends ProductsState {
//   final String error;
//
//   ProductsErrorState(this.error);
//
//   @override
//   List<Object?> get props => [error];
// }

enum ProductsEnum {initial, loading, success, failure}

class ProductsState extends Equatable{
  final ProductsEnum status;
  final List<ProductsModel> products;
  final String errorMessage;

  const ProductsState({this.status = ProductsEnum.initial, this.products = const [], this.errorMessage = ''});

  ProductsState copyWith({ProductsEnum? status, List<ProductsModel>? products, String? errorMessage}){
    return ProductsState(status: status ?? this.status, products: products ?? this.products, errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, products, errorMessage];
}