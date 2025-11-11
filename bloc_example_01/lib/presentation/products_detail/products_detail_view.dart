import 'package:bloc_example_01/presentation/products_detail/bloc/products_detail_bloc.dart';
import 'package:bloc_example_01/presentation/products_detail/bloc/products_detail_bloc.dart';
import 'package:bloc_example_01/presentation/products_detail/bloc/products_detail_event.dart';
import 'package:bloc_example_01/presentation/products_detail/bloc/products_detail_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetailView extends StatefulWidget {
  static const String id = '/products_detail_view';
  final int productId;

  const ProductsDetailView({super.key, required this.productId});

  @override
  State<ProductsDetailView> createState() => _ProductsDetailViewState();
}

class _ProductsDetailViewState extends State<ProductsDetailView> {
  @override
  void initState() {
    context.read<ProductsDetailBloc>().add(FetchProductById(widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products Detail')),
      body: BlocBuilder<ProductsDetailBloc, ProductsDetailState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: state.status == ProductsDetailEnum.loading
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.white70),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: state.product.image ?? '',
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Icon(Icons.broken_image, size: 100),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              state.product.title ?? '',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
                            ),
                            SizedBox(height: 5),
                            Text(
                              state.product.description ?? '',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Price: \$ ${state.product.price}',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Rating: ${state.product.rating?.rate}',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
                            ),
                            SizedBox(height: 20),
                            MaterialButton(
                              minWidth: double.infinity,
                              height: 70,
                              color: Colors.deepPurple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Bookmark',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
