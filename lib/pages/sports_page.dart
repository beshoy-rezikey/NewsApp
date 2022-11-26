import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/news_cubit.dart';
import '../widgets/article_builder.dart';

import '../utilities/colors.dart';
import '../widgets/news_item.dart';
import '../widgets/separtor_widget.dart';

class sports_page extends StatelessWidget {
  const sports_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var sportsList = NewsCubit.get(context).sports;
        return articleBuilder(articeList: sportsList,context: context);
      },
    );
  }
}
