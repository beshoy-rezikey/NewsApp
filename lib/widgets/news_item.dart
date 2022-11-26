import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/cubit/news_cubit.dart';
import 'package:news_app/pages/web_view.dart';

Widget MyNewsItemWidget({
  required BuildContext context,
  required String imageUrl,
  required String? title,
  String? date,
  required String url,
}) {
  return BlocConsumer<NewsCubit, NewsState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return InkWell(
        onTap: () {
          NewsCubit.get(context)
              .navigateTo(context: context, widget: WebViewScreen(url: url));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          title!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        date.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
