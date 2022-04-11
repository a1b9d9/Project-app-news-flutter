import 'package:app_news/layout/news_app/cupit_New_App/states.dart';
import 'package:app_news/modulse/news_Screen/search_screen/search.dart';
import 'package:app_news/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cupit_New_App/cubit.dart';

class AppNews extends StatelessWidget {
  const AppNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("New Apps"),
            actions: [
              IconButton(
                  onPressed: () {
                    navigator(context, const Search());
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    NewsCubit.get(context).changeThem();
                  },
                  icon: const Icon(
                    Icons.brightness_4,
                    size: 30,
                  )),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index: index);
            },
            items: cubit.bottomItem,
          ),
          body: cubit.screen[cubit.currentIndex],
        );
      },
    );
  }
}
