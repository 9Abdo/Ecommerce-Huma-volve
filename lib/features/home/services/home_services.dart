import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/constants/api_endpoint.dart';
import 'package:ecommerce_app_huma_volve/core/network/client_network.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/product_model.dart';

class HomeServices {
  final ClientNetwork clientNetwork;
  HomeServices(this.clientNetwork);
  Future<List<CategoryModels>> getCategory() async {
    final Response response = await clientNetwork.dio.get(
      ApiEndpoint.categories,
    );
    List categoryList = response.data;
    List<CategoryModels> categoryModels = categoryList
        .map((e) => CategoryModels.fromJson(e))
        .toList();
    log(categoryModels.toString());
    //categoryModels.insert(0, CategoryModels(name: "All"));

    return categoryModels;
  }

  Future<List<ProductModel>> getProduct(int productId) async {
    final Response response = await clientNetwork.dio.get(
      "${ApiEndpoint.categories}/$productId/${ApiEndpoint.products}",
    );
    List productList = response.data;
    List<ProductModel> productModels = productList
        .map((e) => ProductModel.fromJson(e))
        .toList();

    return productModels;
  }
}
