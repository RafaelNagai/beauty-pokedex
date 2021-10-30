import 'package:beauty_pokedex/core/environment/environment.dart';
import 'package:get/get.dart';

import 'http.dart';

class GetHttp extends GetConnect implements Http {
  GetHttp({
    required this.environment,
  });

  final Environment environment;

  @override
  Future<Response> getResponse(String url) => get('${environment.url}/$url');
}
