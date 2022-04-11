import 'package:app_news/layout/news_app/cupit_New_App/cubit.dart';
import 'package:app_news/layout/news_app/cupit_New_App/states.dart';
import 'package:app_news/shared/components/constants.dart';
import 'package:app_news/shared/network/local/cach_helper.dart';
import 'package:app_news/shared/network/local/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_app/app_news.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //وقت بصير بل مين دالة اسينك لازم حط هل تعليمة مشان تتأكد انو كلو جاهز بما انو اسنك بتشغل ثريد فبدو يتأكد انو خلصت
  Bloc.observer = MyBlocObserver();
  DioHelper.inti();
  await CacheHelper.init();
  // bool? isDark =CacheHelper.getBoolData(value: "isDark");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getDataBusiness(),
      //نقطين هون يعني وال ما يفتح تطبيق بتشتغل هل دالة فورا
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
          print("عم اسمعكككك");
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: ThemeData //هون ثيم لكل تطبيق
                (
              primarySwatch: Colors.deepOrange,
              //ون لتعديل على كل الوان تطبيق هو ولسطر يلي تحتو
              primaryColor: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              //هون لح تعدل على كلشي سكافولد لون
              appBarTheme:
                  const AppBarTheme //appbar تغير لون وهون شغل لكل تطيبق
                      (
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                systemOverlayStyle: SystemUiOverlayStyle(
                  //هون عدلنا على شريط يلي فوق بار وعدلنا بالوان ودقة الأيقونات
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  //هون تعديل على البار تحتاني كمان لكل تطبيق
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
            ),

            darkTheme: ThemeData(

                hintColor: Colors.white,
                primarySwatch: Colors.deepOrange,
                //ون لتعديل على كل الوان تطبيق هو ولسطر يلي تحتو
                primaryColor: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor("333739"),
                //هون لح تعدل على كلشي سكافولد لون
                appBarTheme: AppBarTheme //appbar تغير لون وهون شغل لكل تطيبق
                    (
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    //هون عدلنا على شريط يلي فوق بار وعدلنا بالوان ودقة الأيقونات
                    statusBarColor: Colors.black,
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor("333739"),
                  elevation: 0,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  //هون تعديل على البار تحتاني كمان لكل تطبيق
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor("333739"),
                  unselectedItemColor: Colors.grey,
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  bodyText2: TextStyle(
                      fontSize: 15,
                      color: Colors.white),),
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                )),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const Directionality(
                textDirection: TextDirection.rtl,
                child:
                    AppNews()), //تغير اتجاه التطبيق Directionality مشان قصة العربي
          );
        },
      ),
    );
  }
}
