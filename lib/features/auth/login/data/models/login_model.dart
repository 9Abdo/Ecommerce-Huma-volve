import 'package:ecommerce_app_huma_volve/features/auth/login/domains/entitiy/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.accessToken, required super.refreshToken});
  factory LoginModel.fromjson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json["access_token"],
      refreshToken: json['refresh_token'],
    );
  }
}
