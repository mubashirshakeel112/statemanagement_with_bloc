import 'package:equatable/equatable.dart';

abstract class ProductsDetailEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class FetchProductById extends ProductsDetailEvent{
  final int id;

  FetchProductById(this.id);

  @override
  List<Object?> get props => [id];
}