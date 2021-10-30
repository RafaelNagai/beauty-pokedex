import 'package:get/get.dart';

class _DI {
  T get<T>() {
    return Get.find<T>();
  }

  register<T>(dynamic object) {
    Get.put<T>(object);
  }
}

// ignore: non_constant_identifier_names
final _DI DI = _DI();
