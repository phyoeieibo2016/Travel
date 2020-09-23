import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:travel_flutter/resource/models/app_setting.dart';
import 'package:travel_flutter/themes/theme.dart';

import 'config/routs.dart';
import 'localization/app_localization.dart';
import 'models/language.dart';
import 'widgets/customRoute.dart';
import 'pages/main_page.dart';
import 'pages/place_detail_page.dart';


void main() async{
  runApp(
    Multiprovider(
      providers:  [
        ChangeNotifierProvider(create: (context) => AppSetting()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppSetting>(builder: (context, appSetting, child){
      return MaterialApp(
        locale: appSetting.currentLanguage(),
        title: 'Traveller',
        darkTheme: AppTheme.darkTheme,
        themeMode: appSetting.currentTheme(),
        theme: AppTheme.lightTheme,
        supportedLocales: Language.languageList()
            .map((language) =>
            Locale(language.languageCode, language.countryCode))
            .toList(),
        localizationsDelegates: [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeListResolutionCallback: (deviceLocale, supportedLocale){
          for(var locale in supportedLocale){
            if(locale.languageCode == deviceLocale.languageCode &&
            locale.countryCode == deviceLocale.languageCode){
              return deviceLocale;
            }
          }
          return supportedLocale.first;
        },
        routes: Routes.getRoute(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name.contains('detail')) {
            return CustomRoute<bool>(
                builder: (BuildContext context) => PlaceDetailPage());
          } else {
            return CustomRoute<bool>(
                builder: (BuildContext context) => MainPage());
          }
        },
        initialRoute: "MainPage",
      );
    });
  }
}