import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/news_cubit.dart';
import '../widgets/article_builder.dart';
import '../widgets/text_form_field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(

            leading: IconButton(
              
                onPressed: () {
                  Navigator.pop(context);
                  cubit.Search.clear();
                  cubit.searchContoller.clear();
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MyTextFormField(
                  context: context,
                  controller: cubit.searchContoller,
                  type: TextInputType.text,
                  validate: (String? vlaue) {
                    if (vlaue!.isEmpty)
                      return 'please enter value ';
                    else
                      return null;
                  },
                  lable: 'Search',
                  preFix: Icons.search,
                  onChange: (value) {
                    cubit.getDataOfSearch(cubit.searchContoller.text);
                  },
                ),
              ),
              Expanded(
                  child: articleBuilder(
                      articeList: cubit.Search,
                      context: context,
                      isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
