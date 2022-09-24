import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_App/cubit/cubit.dart';
import '../../../layout/news_App/cubit/states.dart';
import '../../../shared/components/components.dart';

// ignore: use_key_in_widget_constructors
class ScianceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sciance;
        return articleBuilder(list, context);
      },
    );
  }
}
