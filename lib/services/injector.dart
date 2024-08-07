import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:giftbox/services/apis/index.dart';
import 'package:giftbox/services/repositories/index.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final injector = GetIt.instance;

Future initInjector() async {
  final chatGptDio =
      Dio(BaseOptions(baseUrl: dotenv.get("CHATGPT_BASE_URL"), headers: {
    "Authorization": "Bearer ${dotenv.get('CHATGPT_SECRET_KEY')}",
    "Content-Type": "application/json",
  }));
  chatGptDio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
    enabled: kDebugMode,
  ));

  injector.registerLazySingleton<Dio>(() => chatGptDio,
      instanceName: "ChatGPTDio");

  injector.registerFactory<ChatGptApiClient>(
      () => ChatGptApiClient(injector(instanceName: "ChatGPTDio")));

  injector
      .registerFactory<ChatGptRepository>(() => ChatGptRepository(injector()));
}
