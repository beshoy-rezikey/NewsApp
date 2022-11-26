import 'package:dio/dio.dart';
import 'package:news_app/widgets/drob_down_list.dart';
import 'dio_helper.dart';
import 'model.dart';

class NewsRepo {
  final DioHelper dioHelper;

  NewsRepo(this.dioHelper);

  Future<List<Articles>> getDataBuisness({required String CountryName}) async {
    final Map<String, dynamic> response =
        await dioHelper.getData(Category: 'business', country:CountryName );

    News news = News.fromJson(response);
    List<Articles> articles =
        news.articles!.map((e) => Articles.fromJson(e.toJson())).toList();
    return articles;
  }

  Future<List<Articles>> getDataSport({required String CountryName}) async {
    final Map<String, dynamic> response =
        await dioHelper.getData(Category: 'sports', country: CountryName);
    News news = News.fromJson(response);

    print('repo methdo');
    List<Articles> articles =
        news.articles!.map((e) => Articles.fromJson(e.toJson())).toList();
    return articles;
  }

  Future<List<Articles>> getDataSience({required String CountryName}) async {
    final Map<String, dynamic> response =
        await dioHelper.getData(Category: 'science', country: CountryName);
    News news = News.fromJson(response);

    print('repo methdo');
    List<Articles> articles =
        news.articles!.map((e) => Articles.fromJson(e.toJson())).toList();
    return articles;
  }

  Future<List<Articles>> getDataOfSearch(String value) async {
    final Map<String, dynamic> response =
        await dioHelper.getSearch(Value: value);
    News news = News.fromJson(response);

    print('repo methdo');
    List<Articles> articles =
        news.articles!.map((e) => Articles.fromJson(e.toJson())).toList();
    return articles;
  }
}
