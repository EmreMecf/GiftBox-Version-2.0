import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/core/configs/font.dart';
import 'package:giftbox/services/injector.dart';
import 'package:giftbox/services/navigation/index.dart';
import 'package:giftbox/viewmodel/history_detail_navigation_view_model.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

import 'core/configs/thema/theme.dart';
import 'core/utils/theme.dart';
import 'features/feedback/feed_back_error.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initInjector();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, displayFont, bodyFont);
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => injector<SendMessagesViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<HistoryViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<MessagesViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<SignInViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<SignOutViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<ProfileViewModel>()..loadUserData()),
        Provider(create: (_) => injector<HomeViewModel>()),
        Provider(create: (_) => injector<HistoryDetailNavigationViewModel>()),
        Provider(create: (_) => injector<ProfileRouteViewModel>()),
        Provider(create: (_) => injector<SettingsViewModel>()),
        Provider(create: (_) => injector<NavBarRoute>()),
        ChangeNotifierProvider(create: (_) => injector<ProfileEditViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<UpdateProfileViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<UpdateProfileImageViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<LanguageViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<FeedbackViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<ErrorViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<ThemeViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<CalendarViewModel>()),
        ChangeNotifierProvider(
            create: (_) => injector<CategorySelectionViewModel>()),
        ChangeNotifierProvider(create: (_) => injector<ChatBotViewModel>()),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, child) {
          return Column(
            children: [
              const FeedbackError(),
              Expanded(
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: injector<NavigationService>().router,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  theme: theme.light(),
                  darkTheme: theme.dark(),
                  themeMode: themeViewModel.themeMode,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
