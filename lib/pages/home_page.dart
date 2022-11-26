import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Api/repo.dart';
import '../logic/cubit/news_cubit.dart';
import 'search_page.dart';
import '../utilities/constants.dart';
import '../widgets/bottom_nav_bar.dart';

class NewsHomePage extends StatelessWidget {
  NewsHomePage({super.key, @required this.newsRepo});
  NewsRepo? newsRepo;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.navigateTo(context: context, widget: SearchScreen());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.changeThemeMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
            title:  Text(cubit.changeAppBar(cubit.bottomNavIndex)),
          ),
          bottomNavigationBar: myBottomNavBar(
            context: context,
            icon: cubit.BottomNavItems,
            activeIndex: cubit.bottomNavIndex,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
          ),
          body: cubit.screens[cubit.bottomNavIndex],
        );
      },
    );
  }
}
