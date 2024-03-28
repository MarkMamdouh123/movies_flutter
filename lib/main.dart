import 'package:flutter/material.dart';
import 'package:movies/home_screen.dart';
import 'package:movies/splash.dart';

import 'package:movies/ui/Home_Tab/recommended_details_screen.dart';
import 'package:movies/ui/Home_Tab/recommended_widget.dart';
import 'package:movies/ui/Movies/movies_list_widget.dart';
import 'package:movies/Provider/provider.dart';
import 'package:movies/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var Provider = provider();
  await Provider.login();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (buildContext) => Provider),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedLabelStyle: TextStyle(fontFamily: "a"),
          selectedLabelStyle: TextStyle(fontFamily: "a"),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          enableFeedback: false,
          backgroundColor: Colors.transparent,
          unselectedIconTheme: IconThemeData(size: 32),
          selectedIconTheme: IconThemeData(size: 32),
          selectedItemColor: Color(0xffFFB224),
        ),
        primaryColor: Color(0xff1A1A1A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          secondary: Color(0xffFFB224),
        ),
        useMaterial3: true,
      ),
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => Splash(),
        HomeScreen.routeName: (context) => HomeScreen(),
        MoviesListWidget.routeName: (context) => MoviesListWidget(),
        RecommendedMovieWidget.routeName: (context) => RecommendedMovieWidget(),
        RecommendedMovieDetailScreen.routeName: (context) =>
            RecommendedMovieDetailScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
