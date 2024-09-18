import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:giftbox/services/apis/index.dart';
import 'package:giftbox/services/firebase/index.dart';
import 'package:giftbox/services/repositories/firebase_firestore_repository.dart';
import 'package:giftbox/services/repositories/firebasee_storage_repository.dart';
import 'package:giftbox/services/repositories/index.dart';
import 'package:giftbox/viewmodel/history_detail_navigation_view_model.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'navigation/navigation_service.dart';

final injector = GetIt.instance;

Future initInjector() async {
  final chatGptDio =
      Dio(BaseOptions(baseUrl: dotenv.get('CHATGPT_BASE_URL'), headers: {
    "Authorization": "Bearer ${dotenv.get('CHATGPT_SECRET_KEY')}",
    "Content-Type": "application/json",
    "OpenAI-Organization": dotenv.get('CHATGPT_ORGANIZATION'),
    "OpenAI-Project": dotenv.get('CHATGPT_PROJECT'),
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

  //Packages
  injector.registerLazySingleton<Dio>(() => chatGptDio,
      instanceName: "ChatGPTDio");

  //navigator
  injector.registerLazySingleton(() => NavigationService(injector()));

  //Services
  injector.registerFactory<ChatGptApiClient>(
      () => ChatGptApiClient(injector(instanceName: "ChatGPTDio")));
  injector.registerFactory<FirebaseAuthService>(() => FirebaseAuthService());
  injector.registerFactory<FirebaseFirestoreService>(
      () => FirebaseFirestoreService());
  injector
      .registerFactory<FirebaseStorageService>(() => FirebaseStorageService());

  //Repositories
  injector.registerFactory<FirebaseFirestoreRepository>(
      () => FirebaseFirestoreRepository(injector()));
  injector
      .registerFactory<ChatGptRepository>(() => ChatGptRepository(injector()));
  injector.registerFactory<FirebaseAuthRepository>(
      () => FirebaseAuthRepository(injector()));
  injector.registerFactory<FirebaseStorageRepository>(
      () => FirebaseStorageRepository(injector()));

  //ViewModel
  injector.registerFactory<SignInViewModel>(
      () => SignInViewModel(injector(), injector()));
  injector.registerFactory<SignOutViewModel>(
      () => SignOutViewModel(injector(), injector()));
  injector.registerFactory<MessagesViewModel>(() => MessagesViewModel());
  injector
      .registerFactory<HistoryViewModel>(() => HistoryViewModel(injector()));
  injector
      .registerFactory<SendMessagesViewModel>(() => SendMessagesViewModel());
  injector
      .registerFactory<ProfileViewModel>(() => ProfileViewModel(injector()));
  injector.registerFactory<HomeViewModel>(() => HomeViewModel(injector()));
  injector.registerFactory<HistoryDetailNavigationViewModel>(
      () => HistoryDetailNavigationViewModel(injector()));
  injector.registerFactory<ProfileRouteViewModel>(
      () => ProfileRouteViewModel(injector()));
  injector.registerFactory<ProfileEditViewModel>(
      () => ProfileEditViewModel(injector()));
  injector.registerFactory<UpdateProfileViewModel>(
      () => UpdateProfileViewModel(injector(), injector(), injector()));
  injector.registerFactory<UpdateProfileImageViewModel>(
      () => UpdateProfileImageViewModel(injector(), injector()));
  injector.registerFactory<LanguageViewModel>(() => LanguageViewModel());
  injector
      .registerFactory<FeedbackViewModel>(() => FeedbackViewModel(injector()));
  injector.registerFactory<ErrorViewModel>(() => ErrorViewModel());
  injector
      .registerFactory<SettingsViewModel>(() => SettingsViewModel(injector()));
  injector.registerLazySingleton<ThemeViewModel>(() => ThemeViewModel());
  injector.registerFactory<CalendarViewModel>(() => CalendarViewModel());
  injector.registerFactory<NavBarRoute>(() => NavBarRoute(injector()));
  injector.registerFactory<CategorySelectionViewModel>(
      () => CategorySelectionViewModel());
  injector.registerFactory<ChatBotViewModel>(
      () => ChatBotViewModel(injector(), injector(), injector()));
}
