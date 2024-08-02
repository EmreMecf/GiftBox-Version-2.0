import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:giftbox/services/apis/index.dart';
import 'package:giftbox/services/repositories/index.dart';

final injector = GetIt.instance;

Future initInjector() async {
  final chatGptDio = Dio(BaseOptions(
      baseUrl: dotenv.get("CHATGPT_BASE_URL"),
      headers: {
        "Authorization": "Bearer ${dotenv.get('CHATGPT_SECRET_KEY')}"
      }));

  injector.registerLazySingleton<Dio>(() => chatGptDio,
      instanceName: "ChatGPTDio");

  injector.registerFactory<ChatGptApiClient>(
      () => ChatGptApiClient(injector(instanceName: "ChatGPTDio")));

  injector.registerFactory<ChatGptRepository>(
      () => ChatGptRepository(injector(instanceName: "ChatGPTDio")));
}
