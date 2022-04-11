import 'package:app_news/layout/news_app/cupit_New_App/cubit.dart';
import 'package:app_news/layout/news_app/cupit_New_App/states.dart';
import 'package:app_news/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var search = TextEditingController();
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
                child: formfield(context,
                    controller: search,
                    type: TextInputType.text,
                    label: "Search",
                    validat: (val) {},
                    pre_icon: const Icon(Icons.search),
                    onchange: (value) {
                      NewsCubit.get(context).getDataSearch(value);
                    }),
              ),
              Expanded(child: buildList(list, context,enable: true))
            ],
          ),
        );
      },
    );
  }
}
