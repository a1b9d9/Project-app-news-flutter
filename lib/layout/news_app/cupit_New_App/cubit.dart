import 'package:app_news/layout/news_app/cupit_New_App/states.dart';
import 'package:app_news/modulse/news_Screen/business_screen/business.dart';
import 'package:app_news/modulse/news_Screen/science_screen/science.dart';
import 'package:app_news/modulse/news_Screen/sports_screen/sport.dart';
import 'package:app_news/shared/network/local/cach_helper.dart';
import 'package:app_news/shared/network/local/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    //هون ساوينا بار تحت ثابت وبل عادة بياخد تلت اوبجكت منو ل اكون تبعو اساسية وفي ليبل
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: "Business"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: "Sports"),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: "Science"),

  ];
  List<Widget> screen = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeIndex({required int index}) {
    currentIndex = index;

    if (currentIndex == 0) {
      getDataBusiness();
    }
    else if (currentIndex == 1) {
      getDataSports();
    }
    else if (currentIndex == 2) {
      getDataScience();
    }

    emit(NewsBottomNivState());
  }


  List<dynamic> business = [];

  void getDataBusiness() {
    emit(NewsLoadingBusinessScreenState());
    if (business.length <= 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "business",
        "apiKey": "28cf3611e1dd4f4abdc0bd2986888fed"
      }).then((value) {
        business = value.data["articles"];
        emit(NewsGetBusinessScreenState());
      }).catchError((e) {
        emit(NewsErrorBusinessScreenState(e.toString()));
      });
    }
    else {
      emit(NewsGetBusinessScreenState());
    }
  }


  List<dynamic> sports = [];

  void getDataSports() {
    emit(NewsLoadingSportsScreenState());
    if (sports.length <= 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "28cf3611e1dd4f4abdc0bd2986888fed"
      }).then((value) {
        sports = value.data["articles"];
        emit(NewsGetSportsScreenState());
      }).catchError((e) {
        emit(NewsErrorSportsScreenState(e.toString()));
      });
    }
    else {
      emit(NewsGetSportsScreenState());
    }
  }


  List<dynamic> sciences = [];

  void getDataScience() {
    emit(NewsLoadingScienceScreenState());
    if (sciences.length <= 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "us",
        "category": "science",
        "apiKey": "28cf3611e1dd4f4abdc0bd2986888fed"
      }).then((value) {
        sciences = value.data["articles"];
        emit(NewsGetScienceScreenState());
      }).catchError((e) {
        emit(NewsErrorScienceScreenState(e.toString()));
      });
    }
    else {
      emit(NewsGetScienceScreenState());
    }
  }


  bool isDark = false;

  void changeThem() {
    isDark = !isDark;
    CacheHelper.putData(key: "isDark", value: isDark);
    emit(NewsChangeThemScreenState());
  }



  List<dynamic> search = [];

  void getDataSearch(value) {
    emit(NewsLoadingSearchScreenState());
    DioHelper.getData(url: "v2/everything", query: {
      "q": "${value}",
      "apiKey": "28cf3611e1dd4f4abdc0bd2986888fed"
    }).then((value) {
      search = value.data["articles"];

      emit(NewsGetSearchScreenState());
    }).catchError((e) {
      emit(NewsErrorSearchScreenState(e.toString()));
    });
  }
}