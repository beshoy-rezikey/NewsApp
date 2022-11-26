import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/widgets/drob_down_list.dart';
import '../../Api/cash_helper.dart';
import '../../Api/repo.dart';
import '../../pages/business_page.dart';
import '../../pages/science_page.dart';
import '../../pages/setting_page.dart';
import '../../pages/sports_page.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo newsRepo;

  NewsCubit(this.newsRepo) : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;

  List<IconData> BottomNavItems = [
    Icons.business_sharp,
    Icons.sports,
    Icons.science_sharp,
    Icons.settings,
  ];
  void changeNavBar(int index) {
    bottomNavIndex = index;
    if (bottomNavIndex == 0) getDataBuisness();
    if (bottomNavIndex == 1) getDataSports();
    if (bottomNavIndex == 2) getDataSience();
    emit(NewsChangeBottomNavState());
  }

  String changeAppBar(int index) {
    bottomNavIndex = index;
    if (bottomNavIndex == 0)
      return APPpar[index];
    else if (bottomNavIndex == 1)
      return APPpar[index];
    else if (bottomNavIndex == 2)
      return APPpar[index];
    else
      return APPpar[3];
  }

  List<Widget?> screens = [
    Buisness_page(),
    sports_page(),
    science_page(),
    settings_page()
  ];

  List<String> APPpar = [
    'BuisnessNews',
    'SportsNews',
    'ScienceNews',
    'Settings',
  ];
  List<dynamic> buisness = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  Future<List> getDataBuisness() async {
    emit(BusinessLoadingState());
    try {
      buisness = await newsRepo.getDataBuisness(CountryName: countryNAME);
      emit(BusinessSuccessGetDataState());
      return buisness;
    } catch (e) {
      print(e.toString());
      emit(BusinessErrorGetDataState(e.toString()));
      return [];
    }
  }

  Future<List> getDataSports() async {
    emit(SportsLoadingState());
    try {
      sports = await newsRepo.getDataSport(CountryName: countryNAME);
      emit(SportSuccessGetDataState());
      return sports;
    } catch (e) {
      print(e.toString());
      emit(SportErrorGetDataState(e.toString()));
      return [];
    }
  }

  Future<List> getDataSience() async {
    emit(SCienceLoadingState());
    try {
      science = await newsRepo.getDataSience(CountryName: countryNAME);
      emit(SCienceSuccessGetDataState());
      return science;
    } catch (e) {
      print(e.toString());
      emit(SCienceErrorGetDataState(e.toString()));
      return [];
    }
  }

  bool isDark = false;
  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      print('=============$fromShared=============');

      isDark = fromShared;
      print('============$isDark===================');
      emit(NewsChangeThemeModeState());
    } else {
      isDark = !isDark;

      CashHelper.putTheme(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeThemeModeState());
      });
    }
  }

  void navigateTo({required BuildContext context, required Widget widget}) =>
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ));
  List Search = [];
  TextEditingController searchContoller = TextEditingController();

  Future<List> getDataOfSearch(String value) async {
    emit(SearchLoadingsGetDataState());

    try {
      Search = await newsRepo.getDataOfSearch(value);
      emit(SearchSuccessGetDataState());

      return Search;
    } catch (e) {
      print(e.toString());
      emit(SearchErrorGetDataState(e.toString()));
      return [];
    }
  }

  String countryNAME = 'eg';
  Widget changeCountry({
    required BuildContext context,
  }) {
    return myDrobDowmList(
      context: context,
      onChange: (Country) {
        countryNAME = Country.CountryCode;
        print(
            '=======================country  name is : $countryNAME==========');
        emit(ChangeCountryState());
      },
    );
  }
}
