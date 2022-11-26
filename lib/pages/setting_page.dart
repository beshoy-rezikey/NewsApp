import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/cubit/news_cubit.dart';
import 'package:news_app/pages/country.dart';
import 'package:news_app/widgets/drob_down_list.dart';
import '../utilities/colors.dart';
import '../widgets/app_change_mode.dart';

class settings_page extends StatelessWidget {
  settings_page({super.key});
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              Theme.of(context).focusColor, // Set border color
                          width: 3.0), // Set border width
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: appMode(
                      context: context,
                      appMode: 'App Theme',
                      value: cubit.isDark,
                      Themcahngechange: (value) {
                        cubit.changeThemeMode();
                      }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context)
                                .focusColor, // Set border color
                            width: 3.0), // Set border width
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: cubit.changeCountry(context: context)),
              ),
            ],
          ),
        );
      },
    );
  }
}
