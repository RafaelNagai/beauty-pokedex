import 'package:get/get.dart';

abstract class Http {
  Future<Response> getResponse(String url);
}
