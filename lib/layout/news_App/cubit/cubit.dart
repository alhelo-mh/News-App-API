import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/news_App/cubit/states.dart';
import 'package:news_api/modules/news_app/business/business_screen.dart';
import 'package:news_api/modules/news_app/sciance/sciance_screen.dart';
import 'package:news_api/modules/news_app/sports/sports_screen.dart';
import 'package:news_api/shared/network/remot/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<String> titles = [
    'BUSINESS',
    'SPORTS',
    'HEALTH',
  ];
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business_center_outlined,
        ),
        label: 'business'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_baseball_outlined,
        ),
        label: 'sports'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.health_and_safety_outlined,
        ),
        label: 'health'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScianceScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getSciance();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'de',
      'category': 'business',
      'apiKey': '1dd2d03ba4284bf5bdd4d9092ebd82b0'
    })
        // ignore: avoid_print
        .then((value) {
      // print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      // ignore: avoid_print
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsSportLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'de',
        'category': 'sports',
        'apiKey': '1dd2d03ba4284bf5bdd4d9092ebd82b0'
      })
          // ignore: avoid_print
          .then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];

        // ignore: avoid_print
        print(sports[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        // ignore: avoid_print
        print(error.toString());
        emit(NewsGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> sciance = [];
  void getSciance() {
    emit(NewsSciencstLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'de',
        'category': 'health',
        'apiKey': '1dd2d03ba4284bf5bdd4d9092ebd82b0'
      })
          // ignore: avoid_print
          .then((value) {
        // print(value.data['articles'][0]['title']);
        sciance = value.data['articles'];
        // ignore: avoid_print
        print(sciance[0]['title']);
        emit(NewsGetSciencsSuccessState());
      }).catchError((error) {
        // ignore: avoid_print
        print(error.toString());
        emit(NewsGetSciencsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSciencsSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    //  search = [];
    emit(NewsSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      // ignore: unnecessary_string_interpolations
      'q': '${value}',
      'apiKey': '1dd2d03ba4284bf5bdd4d9092ebd82b0'
    })
        // ignore: avoid_print
        .then((value) {
      // print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      // ignore: avoid_print
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
