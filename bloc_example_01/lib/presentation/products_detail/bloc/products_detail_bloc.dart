import 'package:bloc/bloc.dart';
import 'package:bloc_example_01/presentation/products_detail/bloc/products_detail_event.dart';
import 'package:bloc_example_01/presentation/products_detail/bloc/products_detail_state.dart';
import 'package:bloc_example_01/repository/products_repo.dart';
import 'package:meta/meta.dart';

class ProductsDetailBloc extends Bloc<ProductsDetailEvent, ProductsDetailState> {
  final ProductsRepository productsRepository;

  ProductsDetailBloc(this.productsRepository) : super(ProductsDetailState()) {
    on<FetchProductById>(_onFetchProductsById);
  }

  Future<void> _onFetchProductsById(FetchProductById event, Emitter<ProductsDetailState> emit) async {
    emit(state.copyWith(status: ProductsDetailEnum.loading));
    try {
      final product = await productsRepository.getProductById(event.id);
      emit(state.copyWith(status: ProductsDetailEnum.success, product: product));
    } catch (e) {
      emit(state.copyWith(status: ProductsDetailEnum.failure, errorMessage: e.toString()));
    }
  }
}