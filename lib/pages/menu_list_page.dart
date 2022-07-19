import 'package:coffee_master/datamanager.dart';
import 'package:coffee_master/datamodel.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  final DataManager dataManager;

  const MenuList({Key? key, required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return FutureBuilder<List<Category>>(
      future: dataManager.getMenu(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // EACH CATEGORY STARTS HERE
                var category = snapshot.data![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, bottom: 8.0, left: 8.0),
                      child: Text(
                        category.name,
                        style: TextStyle(color: Colors.brown.shade400),
                      ),
                    ),
                    if (screenSize.width < 500)
                      // EACH MENU ITEM, Mobile Viewport
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: category.products.length,
                        itemBuilder: (context, index) {
                          return ProductItem(
                            product: category.products[index],
                            onAdd: (p) => dataManager.cartAdd(p),
                          );
                        },
                      )
                    else
                      // EACH MENU ITEM, Large Viewport
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.spaceAround,
                          children: [
                            for (var product in category.products)
                              SizedBox(
                                width: 350,
                                child: ProductItem(
                                  product: product,
                                  onAdd: (p) => dataManager.cartAdd(p),
                                ),
                              )
                          ],
                        ),
                      )
                  ],
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({
    Key? key,
    required this.product,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset('images/wlcm.jpg')],
    );
  }
}
