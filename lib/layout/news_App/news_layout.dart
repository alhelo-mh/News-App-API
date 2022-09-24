import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/news_App/cubit/cubit.dart';
import 'package:news_api/layout/news_App/cubit/states.dart';
import 'package:news_api/modules/news_app/search/search_screen.dart';
import 'package:news_api/shared/components/components.dart';
import 'package:news_api/shared/cubit/cubit.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App / ' + cubit.titles[cubit.currentIndex]),
            //title: const Text('News App'),
            actions: [
              IconButton(
                iconSize: 35,
                icon: const Icon(Icons.search_outlined),
                onPressed: () {
                  navigateTO(context, SearchScreen());
                },
              ),
              IconButton(
                iconSize: 35,
                icon: const Icon(Icons.brightness_4_outlined),
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeBottomNavBar(value);
              },
              items: cubit.bottomItem),
        );
      },
    );
  }
}
