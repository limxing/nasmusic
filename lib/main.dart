import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'home_page.dart';

void main() async{
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _botToastBuilder = BotToastInit();
  static final BotToastNavigatorObserver _botToastNavigatorObserver = BotToastNavigatorObserver();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      initialRoute: ''
          '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage()
      },
      theme: const CupertinoThemeData(
        primaryColor: Color(0xff3B9BE5),
        primaryContrastingColor: Color(0xff3B9BE5),
        scaffoldBackgroundColor: Color(0xffEFF1F4),
      ),
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh'),
      ],
      builder: (context, child) => _botToastBuilder(
          context,
          MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child ?? const Text("加载中..."),
          )),
      navigatorObservers: [_botToastNavigatorObserver],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}