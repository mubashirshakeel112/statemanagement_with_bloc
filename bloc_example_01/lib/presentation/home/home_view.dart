import 'package:bloc_example_01/presentation/home/bloc/products_bloc.dart';
import 'package:bloc_example_01/presentation/home/bloc/products_event.dart';
import 'package:bloc_example_01/presentation/home/bloc/products_state.dart';
import 'package:bloc_example_01/presentation/products_detail/products_detail_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  static const String id = '/home_view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(FetchProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products'), centerTitle: true, automaticallyImplyLeading: false),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Expanded(
                  child: state.status == ProductsEnum.loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ProductsDetailView.id, arguments: state.products[index].id);
                        },
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: state.products[index].image ?? '',
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                            width: 150,
                            height: 150,
                          ),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.products[index].title ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                              ),
                              Text(
                                state.products[index].description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            '\$ ${state.products[index].price}',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
