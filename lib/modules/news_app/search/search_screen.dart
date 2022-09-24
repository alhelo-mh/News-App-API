import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/news_App/cubit/states.dart';
import 'package:news_api/shared/components/components.dart';

import '../../../layout/news_App/cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.grey[200],
                  child: defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      onChange: (value) {
                        NewsCubit.get(context).getSearch(value);
                        // print(value.toString());
                      },
                      //  onSubmit: ,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Search must not empty';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search),
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
