import 'package:app_news/layout/news_app/cupit_New_App/states.dart';
import 'package:app_news/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cupit_New_App/cubit.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
      var list=NewsCubit.get(context).business;
        return buildList(list,context);
      },
    );
  }
}
