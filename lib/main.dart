import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_api/layout/news_App/news_layout.dart';
import 'package:news_api/shared/bloc_observer.dart';
import 'package:news_api/shared/cubit/cubit.dart';
import 'package:news_api/shared/network/local/ccch_helper.dart';
import 'package:news_api/shared/network/remot/dio_helper.dart';

import 'layout/news_App/cubit/cubit.dart';
import 'shared/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.inti();
  bool isDark;
  isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);

  @override
  //الشغل هادا خاص ب newsapp
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getSciance(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..changeAppMode(
              fromIsDark: isDark,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              //primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              scaffoldBackgroundColor: Colors.white,
              // ignore: prefer_const_constructors
              appBarTheme: AppBarTheme(
                  titleSpacing: 20,

                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  // ignore: prefer_const_constructors
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  // ignore: prefer_const_constructors
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  iconTheme: const IconThemeData(color: Colors.black)),

              // ignore: prefer_const_constructors
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 30.0,
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333740'),
              //primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              // scaffoldBackgroundColor: Colors.white,
              // ignore: prefer_const_constructors
              appBarTheme: AppBarTheme(
                  // ignore: deprecated_member_use
                  titleSpacing: 20,
                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  // ignore: prefer_const_constructors
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333740'),
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: HexColor('333740'),
                  elevation: 0.0,
                  // ignore: prefer_const_constructors
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  iconTheme: const IconThemeData(color: Colors.white)),

              // ignore: prefer_const_constructors
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 30.0,
                backgroundColor: HexColor('333740'),
                unselectedItemColor: Colors.grey,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
