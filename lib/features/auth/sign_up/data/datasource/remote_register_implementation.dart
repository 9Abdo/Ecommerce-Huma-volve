import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/network/client_network.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/datasource/remote_register.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/register_request.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/register_response.dart';

import '../../../../../core/constants/api_endpoint.dart';

class RemoteRegisterImplementation implements RemoteRegister {
  final ClientNetwork clientNetwork;

  RemoteRegisterImplementation({required this.clientNetwork});
  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    final Response response = await clientNetwork.dio.post(
      ApiEndpoint.register,
      data: {
        "email": registerRequest.email,
        "name": registerRequest.name,
        "password": registerRequest.password,
        "role": "customer",
        "avatar": "https://thumb.wikimedia.org/wikipedia/commons/thumb/2/26/Leo_messi_barce_2005.jpg/250px-Leo_messi_barce_2005.jpg?utm_source=ar.wikipedia.org&utm_campaign=parser&utm_content=thumbnail",
      },
    );
    return RegisterResponse.fromJson(response.data);
  }
}
