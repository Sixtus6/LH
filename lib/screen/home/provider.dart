import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lh/constant/constant.dart';
import 'package:lh/model/productModel.dart';

class HomePageProvider extends ChangeNotifier {
  List<ProductModel> _products = [];
  List category = ["Categories"];
  final int pageSize = 2;
  int currentPage = 0;
  List<ProductModel> get products => _products;
  List<ProductModel> sortedProducts = [];
  List<ProductModel> filteredProducts = [];

  List<ProductModel> get currentProducts {
    final startIndex = currentPage * pageSize;
    return products.sublist(startIndex, startIndex + pageSize);
  }

  List get catergoryProduct {
    var category = [];
    for (var element in products) {
      category = element.category as List;
    }
    return category;
  }

  void searchProducts(String searchTerm) {
    if (searchTerm.isEmpty) {
      filteredProducts = products;
    } else {
      filteredProducts = products
          .where((product) =>
              product.category.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();

      //  print(filteredProducts);
    }

    // Reset pagination to the first page
    currentPage = 0;
    notifyListeners();
  }

  void setSortedProduct(List<ProductModel> data) {
    // print([_products[0].category, data[0].category]);
    List<ProductModel> sortedValue = data
      ..sort((a, b) {
        num priceA = a.price ?? 0;
        num priceB = b.price ?? 0;
        return priceB.compareTo(priceA);
      });

    sortedProducts = sortedValue;
    notifyListeners();
    //print(_products[0].category);
  }

  fetchProduct() async {
    http.Response response = await http.get(Uri.parse(baseURL));
    List<dynamic> values = json.decode(response.body);
    setSortedProduct(values
        .where((element) => element != null)
        .map((map) => ProductModel.fromJson(map))
        .toList());
    _products = values
        .where((element) => element != null)
        .map((map) => ProductModel.fromJson(map))
        .toList();
  }

  void nextPage() {
    if (currentPage < (products.length / pageSize).ceil() - 1) {
      currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
      notifyListeners();
    }
  }
}
