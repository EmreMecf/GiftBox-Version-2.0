import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/core/configs/font.dart';
import 'package:giftbox/services/injector.dart';
import 'package:giftbox/viewmodel/chat_bot_view_model.dart';
import 'package:provider/provider.dart';

import 'core/configs/thema/theme.dart';
import 'core/utils/go_router.dart';
import 'core/utils/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, displayFont, bodyFont);
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatGptViewModel()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      ),
    );
  }
}
