import 'package:bloc_example_01/domain/models/products_model.dart';
import 'package:equatable/equatable.dart';

// abstract class ProductsDetailState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
//
// class ProductsDetailInitialState extends ProductsDetailState {}
//
// class ProductsDetailLoadingState extends ProductsDetailState {}
//
// class ProductsDetailLoadedState extends ProductsDetailState {
//   final ProductsModel product;
//
//   ProductsDetailLoadedState(this.product);
//
//   @override
//   List<Object?> get props => [product];
// }
//
// class ProductsDetailErrorState extends ProductsDetailState {
//   final String error;
//
//   ProductsDetailErrorState(this.error);
//
//   @override
//   List<Object?> get props => [error];
// }

enum ProductsDetailEnum {initial, loading, success, failure}

class ProductsDetailState extends Equatable{
  final ProductsDetailEnum status;
  final ProductsModel product;
  final String errorMessage;

  const ProductsDetailState({this.status = ProductsDetailEnum.initial, this.product = const ProductsModel(), this.errorMessage = ''});

  ProductsDetailState copyWith({ProductsDetailEnum? status, ProductsModel? product, String? errorMessage}){
    return ProductsDetailState(status: status ?? this.status, product: product ?? this.product, errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, product, errorMessage];
}