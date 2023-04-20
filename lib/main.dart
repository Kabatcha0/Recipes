import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/layout/cubit/cubit.dart';
import 'package:recipes_app/layout/cubit/states.dart';
import 'package:recipes_app/modules/splash.dart';
import 'package:recipes_app/shared/blocobserver.dart';
import 'package:recipes_app/shared/network/local/local.dart';
import 'package:recipes_app/shared/network/remote/remote.dart';
import 'package:recipes_app/shared/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await LocalHelper.init();
  DioHelper.init();
  bool? check = LocalHelper.getBoolMode(key: "TheMode");

  runApp(MyApp(
    check: check,
  ));
}

class MyApp extends StatelessWidget {
  bool? check;
  MyApp({super.key, required this.check});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesCubit()
        ..checkMode(mode: check)
        ..listModelRecipes(),
      child: BlocConsumer<RecipesCubit, RecipesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RecipesCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            themeMode: cubit.check ? ThemeMode.light : ThemeMode.dark,
            home: const Spalsh(),
          );
        },
      ),
    );
  }
}
