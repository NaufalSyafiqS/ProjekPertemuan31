import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'supplemental/asymmetric_view.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required Category category}) : super(key: key);

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    return AsymmetricView(
      products: ProductsRepository.loadProducts(Category.all),
    );
  }
}
