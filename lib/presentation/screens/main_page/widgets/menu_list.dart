import 'package:clean_architecture/data/models/product.dart';
import 'package:clean_architecture/data/repositories/product_req.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  late Future<List<ProductModel>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = HttpProductRepository().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<List<ProductModel>>(
      future: _futureProducts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                        '${NumberFormat.currency(locale: 'ko_KR', symbol: '').format((product.price.toInt()) * 1200)}원'),
                    InkWell(
                        child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueAccent,
                      ),
                      height: 22,
                      width: 40,
                      child: const Text(
                        '담기',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
