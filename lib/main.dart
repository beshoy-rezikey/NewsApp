

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Api/cash_helper.dart';
import 'Api/dio_helper.dart';
import 'Api/repo.dart';
import 'logic/cubit/bloc_observer.dart';
import 'logic/cubit/news_cubit.dart';
import 'pages/home_page.dart';
import 'utilities/colors.dart';
import 'widgets/thems.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  

  // MAKE SURE INIT ARE EXCUTED AS MAIN IS ASYNC
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();

  bool? isDark = CashHelper.getTheme(key: 'isDark');
  if (isDark == null)
    isDark = false;
  else
    isDark = isDark;
  print('=============main is dark : $isDark===============');

  
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isDark});
  final bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(NewsRepo(DioHelper()))
        ..changeThemeMode(fromShared: isDark)
        ..getDataBuisness()..changeCountry(context: context),
        
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: myLightTheme(),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: myDarkTheme(),
            home: NewsHomePage(
              newsRepo: NewsRepo(DioHelper()),
            ),
          );
        },
      ),
    );
  }
}
