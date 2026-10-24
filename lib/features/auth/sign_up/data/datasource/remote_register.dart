import '../models/register_request.dart';
import '../models/register_response.dart';

abstract class RemoteRegister {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}
