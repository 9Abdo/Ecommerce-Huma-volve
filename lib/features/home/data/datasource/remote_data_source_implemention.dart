import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../../core/network/client_network.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/datasource/remote_home_date_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

import '../../../../core/constants/api_endpoint.dart';

class RemoteDataSourceImplemention implements RemoteHomeDateSource {
  final ClientNetwork clientNetwork;

  RemoteDataSourceImplemention({required this.clientNetwork});
  @override
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

  @override
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
