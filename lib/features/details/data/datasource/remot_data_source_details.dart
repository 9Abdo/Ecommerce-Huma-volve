
import 'package:dio/dio.dart';

import 'package:ecommerce_app_huma_volve/core/network/client_network.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/datasource/abstract_data_source_details.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

import '../../../../core/constants/api_endpoint.dart';

class RemotDataSourceDetails implements AbstractDataSourceDetails {
  final ClientNetwork clientNetwork;

  RemotDataSourceDetails({required this.clientNetwork});
  @override
  Future<ProductModel> getProductById(int productId) async {
    final Response response = await clientNetwork.dio.get(
      "${ApiEndpoint.products}/$productId",
    );
  
    

    return ProductModel.fromJson(response.data);
  }
}
