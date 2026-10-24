import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/network/client_network.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/datasource/remote_log_in_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/models/login_model.dart';

import '../../../../../core/constants/api_endpoint.dart';

class RemoteLogInDataSourceImpl implements RemoteLogInDataSource {
  final ClientNetwork clientNetwork;

  RemoteLogInDataSourceImpl({required this.clientNetwork});
  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final Response response = await clientNetwork.dio.post(
      ApiEndpoint.login,
      data: {"email": email, "password": password},
    );

    return LoginModel.fromjson(response.data);
  }
}
