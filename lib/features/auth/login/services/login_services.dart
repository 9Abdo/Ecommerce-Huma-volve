import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/constants/api_endpoint.dart';
import 'package:ecommerce_app_huma_volve/core/network/client_network.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/models/login_model.dart';

class LoginServices {
  final ClientNetwork clientNetwork;
  LoginServices({required this.clientNetwork});
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
