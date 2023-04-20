import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/layout/cubit/cubit.dart';
import 'package:recipes_app/layout/cubit/states.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit, RecipesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RecipesCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CarbonIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CarbonIcons.favorite), label: "Favorites"),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (v) {
              cubit.index(v);
            },
          ),
        );
      },
    );
  }
}
