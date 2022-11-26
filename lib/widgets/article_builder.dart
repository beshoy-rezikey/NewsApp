import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/widgets/date.dart';
import '../logic/cubit/news_cubit.dart';
import 'news_item.dart';
import 'separtor_widget.dart';

Widget articleBuilder(
    {required articeList,
    required BuildContext context,
    bool isSearch = false}) {
  return ConditionalBuilder(
    condition: articeList.length > 0,
    builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => MyNewsItemWidget(
          context: context,
          imageUrl: articeList[index].urlToImage ??
              'https://upload.wikimedia.org/wikipedia/commons/b/b1/Loading_icon.gif',
          title: articeList[index].title.toString(),
          date: date(articeList[index].publishedAt),
          url: articeList[index].url),
      separatorBuilder: (context, index) => seperatorWidegt(),
      itemCount: articeList.length,
    ),
    fallback: (context) => isSearch
        ? Container()
        : Center(
            child: CircularProgressIndicator(
            color: Theme.of(context).focusColor,
          )),
  );
}
