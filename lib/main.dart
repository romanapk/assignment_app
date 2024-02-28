import 'package:assignment_app/screen_dashboard.dart';
import 'package:assignment_app/utilities/provider/theme_change_notifier.dart';
import 'package:assignment_app/utilities/widget_themes/theme_dark.dart';
import 'package:assignment_app/utilities/widget_themes/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('Student_Record');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //throughout if we want to change something in app we use providers
      providers: [
        Provider<ThemeChangeNotifier>(create: (_) => ThemeChangeNotifier()),
      ],
      child: Container(
        child: ChangeNotifierProvider<ThemeChangeNotifier>(
          create: (context) {
            return ThemeChangeNotifier();
          },
          lazy: false,
          child: Consumer<ThemeChangeNotifier>(
            builder: (context, themechangenotifier, _) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeLight.lightThemeData,
                  darkTheme: ThemeDark.darkThemeData,
                  themeMode: themechangenotifier.isDarkTheme
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  title: 'Assignment',
                  // theme: ThemeData(
                  //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                  //     useMaterial3: false),
                  home: const ScreenDashboard());
            },
          ),
        ),
      ),
    );
  }
}
