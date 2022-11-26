part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsChangeBottomNavState extends NewsState {}
class ChangeCountryState extends NewsState {}


class BusinessLoadingState extends NewsState {}

class BusinessSuccessGetDataState extends NewsState {}

class BusinessErrorGetDataState extends NewsState {
  final String error;

  BusinessErrorGetDataState(this.error);
}
class SportsLoadingState extends NewsState {}

class SportSuccessGetDataState extends NewsState {}

class SportErrorGetDataState extends NewsState {
  final String error;

  SportErrorGetDataState(this.error);
}
class SCienceLoadingState extends NewsState {}

class SCienceSuccessGetDataState extends NewsState {}

class SCienceErrorGetDataState extends NewsState {
  final String error;

  SCienceErrorGetDataState(this.error);
}

class NewsChangeThemeModeState extends NewsState {}

class SearchLoadingsGetDataState extends NewsState {}

class SearchSuccessGetDataState extends NewsState {}

class SearchErrorGetDataState extends NewsState {
  final String error;

  SearchErrorGetDataState(this.error);
}



