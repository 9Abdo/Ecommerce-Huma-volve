import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domains/entity/register_entity.dart';

class RegisterResponse extends RegisterEntity {
  RegisterResponse({
    required super.id,
    required super.email,
    required super.password,
    required super.name,
    required super.role,
    required super.avatar,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      role: json['role'],
      avatar: json['avatar'],
    );
  }
}
