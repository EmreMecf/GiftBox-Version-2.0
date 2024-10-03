import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:giftbox/core/configs/font.dart';
import 'package:giftbox/services/firebase/index.dart';
import 'package:giftbox/services/injector.dart';
import 'package:giftbox/services/navigation/index.dart';
import 'package:giftbox/services/repositories/index.dart';
import 'package:giftbox/viewmodel/history_detail_navigation_view_model.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

import 'core/configs/thema/theme.dart';
import 'core/utils/theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initInjector();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // Varsayılan dil İngilizce

  void _setLocale(String languageCode) {
    setState(() {
      _locale = Locale(languageCode); // Yeni dili ayarla
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, displayFont, bodyFont);
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => injector<HistoryViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<MessagesViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<SignInViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<SignOutViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<ProfileViewModel>()..loadUserData()),
        Provider<FirebaseFirestoreService>(
          create: (_) => FirebaseFirestoreService(),
        ),
        ProxyProvider<FirebaseFirestoreService, FirebaseFirestoreRepository>(
          update: (_, firebaseService, __) =>
              FirebaseFirestoreRepository(firebaseService),
        ),
        Provider(create: (_) => injector<HomeViewModel>()),
        Provider(create: (_) => injector<HistoryDetailNavigationViewModel>()),
        Provider(create: (_) => injector<ProfileRouteViewModel>()),
        Provider(create: (_) => injector<SettingsViewModel>()),
        Provider(create: (_) => injector<NavBarRoute>()),
        ChangeNotifierProvider(create: (_) => injector<ProfileEditViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<UpdateProfileViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<HistoryDeleteViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<UpdateProfileImageViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<LanguageViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<FeedbackViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<ErrorViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<ThemeViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<CalendarViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<CategorySelectionViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<ChatBotViewModel>()..fetchLastMessage()),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: injector<NavigationService>().router,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('tr', ''),
            ],
            locale: _locale,
            // Burada locale'i ayarlıyoruz
            theme: theme.light(),
            darkTheme: theme.dark(),
            themeMode: themeViewModel.themeMode,
          );
        },
      ),
    );
  }
}
