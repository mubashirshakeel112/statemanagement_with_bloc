import 'package:bloc/bloc.dart';
import 'package:bloc_example_01/presentation/home/bloc/products_event.dart';
import 'package:bloc_example_01/presentation/home/bloc/products_state.dart';
import 'package:bloc_example_01/repository/products_repo.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;
  ProductsBloc(this.productsRepository) : super(ProductsState()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(FetchProducts event, Emitter<ProductsState> emit) async{
    emit(state.copyWith(status: ProductsEnum.loading));
    try{
      final products = await productsRepository.getProducts();
      emit(state.copyWith(products: products, status: ProductsEnum.success));
    }catch(e){
      emit(state.copyWith(errorMessage: e.toString(), status: ProductsEnum.failure));
    }
  }
}