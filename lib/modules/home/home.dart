import 'dart:developer';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/components/components.dart';
import 'package:recipes_app/layout/cubit/cubit.dart';
import 'package:recipes_app/layout/cubit/states.dart';
import 'package:recipes_app/modules/details/details.dart';

class Home extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  bool check = false;

  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit, RecipesStates>(
        builder: (context, state) {
          var cubit = RecipesCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                leading: cubit.autoModel != null
                    ? Padding(
                        padding: const EdgeInsetsDirectional.only(start: 2),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: cubit.check ? Colors.black : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            cubit.back();
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsetsDirectional.only(start: 2),
                        child: IconButton(
                          icon: Icon(
                            CarbonIcons.list_boxes,
                            color: cubit.check ? Colors.black : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 2),
                    child: IconButton(
                      icon: cubit.check
                          ? const Icon(
                              CarbonIcons.moon,
                              color: Colors.black,
                              size: 30,
                            )
                          : const Icon(
                              CarbonIcons.sun,
                              color: Colors.white,
                              size: 30,
                            ),
                      onPressed: () {
                        cubit.checkMode();
                      },
                    ),
                  ),
                ],
              ),
              body: cubit.listModel != null
                  ? (cubit.autoModel != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: Column(
                            children: [
                              search(
                                  check: cubit.check,
                                  textEditingController: textEditingController,
                                  function: (v) {
                                    if (textEditingController.text.isNotEmpty &&
                                        textEditingController.text != "") {
                                      cubit.searchAutoComplete(
                                          text: textEditingController.text);
                                    }
                                  }),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index) => listTile(
                                        check: cubit.check,
                                        title: cubit
                                            .autoModel!.result[index].display,
                                        function: () {}),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: cubit.autoModel!.result.length),
                              ),
                            ],
                          ))
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi !",
                                  style: TextStyle(
                                      color: cubit.check
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "What Food You Want.",
                                  style: TextStyle(
                                    color: cubit.check
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                search(
                                    check: cubit.check,
                                    textEditingController:
                                        textEditingController,
                                    function: (v) {
                                      if (textEditingController
                                              .text.isNotEmpty &&
                                          textEditingController.text != "") {
                                        cubit.searchAutoComplete(
                                            text: textEditingController.text);
                                      }
                                    }),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Recent recipes",
                                  style: TextStyle(
                                      color: cubit.check
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  height: 258,
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return recipeRecent(
                                            function: () {
                                              if (cubit.listModel!.result[index]
                                                  .canonicalId
                                                  .contains("recipe")) {
                                                cubit.getMoreInfoRecipes(cubit
                                                    .listModel!
                                                    .result[index]
                                                    .canonicalId
                                                    .substring(
                                                        7,
                                                        cubit
                                                            .listModel!
                                                            .result[index]
                                                            .canonicalId
                                                            .length));
                                                cubit.tipsModelRecipes(cubit
                                                    .listModel!
                                                    .result[index]
                                                    .canonicalId
                                                    .substring(
                                                        7,
                                                        cubit
                                                            .listModel!
                                                            .result[index]
                                                            .canonicalId
                                                            .length));
                                              } else {
                                                cubit.getMoreInfoRecipes(cubit
                                                    .listModel!
                                                    .result[index]
                                                    .canonicalId
                                                    .substring(
                                                        12,
                                                        cubit
                                                            .listModel!
                                                            .result[index]
                                                            .canonicalId
                                                            .length));
                                                cubit.tipsModelRecipes(cubit
                                                    .listModel!
                                                    .result[index]
                                                    .canonicalId
                                                    .substring(
                                                        12,
                                                        cubit
                                                            .listModel!
                                                            .result[index]
                                                            .canonicalId
                                                            .length));
                                              }
                                              navigatorPush(
                                                  context: context,
                                                  widget: Details(
                                                    calories: cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition !=
                                                                null &&
                                                            cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition!
                                                                    .calories !=
                                                                null
                                                        ? cubit
                                                            .listModel!
                                                            .result[index]
                                                            .nutrition!
                                                            .calories
                                                        : "X",
                                                    carbohydrates: cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition !=
                                                                null &&
                                                            cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition!
                                                                    .carbohydrates !=
                                                                null
                                                        ? cubit
                                                            .listModel!
                                                            .result[index]
                                                            .nutrition!
                                                            .carbohydrates
                                                        : "X",
                                                    fat: cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition !=
                                                                null &&
                                                            cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition!
                                                                    .fat !=
                                                                null
                                                        ? cubit
                                                            .listModel!
                                                            .result[index]
                                                            .nutrition!
                                                            .fat
                                                        : "X",
                                                    fiber: cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition !=
                                                                null &&
                                                            cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition!
                                                                    .fiber !=
                                                                null
                                                        ? cubit
                                                            .listModel!
                                                            .result[index]
                                                            .nutrition!
                                                            .fiber
                                                        : "X",
                                                    protein: cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition !=
                                                                null &&
                                                            cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition!
                                                                    .protein !=
                                                                null
                                                        ? cubit
                                                            .listModel!
                                                            .result[index]
                                                            .nutrition!
                                                            .protein
                                                        : "X",
                                                    sugar: cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition !=
                                                                null &&
                                                            cubit
                                                                    .listModel!
                                                                    .result[
                                                                        index]
                                                                    .nutrition!
                                                                    .sugar !=
                                                                null
                                                        ? cubit
                                                            .listModel!
                                                            .result[index]
                                                            .nutrition!
                                                            .sugar
                                                        : "X",
                                                    price: cubit
                                                                .listModel!
                                                                .result[index]
                                                                .price !=
                                                            null
                                                        ? cubit
                                                            .listModel!
                                                            .result[index]
                                                            .price!
                                                            .total
                                                        : "X",
                                                    image: cubit
                                                        .listModel!
                                                        .result[index]
                                                        .thumbnailUrl,
                                                  ));
                                            },
                                            check: cubit.check,
                                            image: cubit.listModel!
                                                .result[index].thumbnailUrl,
                                            name: cubit
                                                .listModel!.result[index].name,
                                            star: cubit.listModel!.result[index]
                                                            .userRating !=
                                                        null &&
                                                    cubit
                                                            .listModel!
                                                            .result[index]
                                                            .userRating!
                                                            .score !=
                                                        null
                                                ? (cubit
                                                            .listModel!
                                                            .result[index]
                                                            .userRating!
                                                            .score! *
                                                        10)
                                                    .toStringAsFixed(1)
                                                : "--");
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            width: 8,
                                          ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 4),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "All recipes",
                                  style: TextStyle(
                                      color: cubit.check
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListView.separated(
                                  itemBuilder: (context, index) =>
                                      cardOfListView(
                                          functionFavoritees: () {
                                            cubit.favoritesDetails(
                                                index: index);
                                          },
                                          func: cubit.favorites.values
                                              .toList()[index],
                                          function: () {
                                            if (cubit.listModel!.result[index]
                                                .canonicalId
                                                .contains("recipe")) {
                                              cubit.getMoreInfoRecipes(cubit
                                                  .listModel!
                                                  .result[index]
                                                  .canonicalId
                                                  .substring(
                                                      7,
                                                      cubit
                                                          .listModel!
                                                          .result[index]
                                                          .canonicalId
                                                          .length));
                                              cubit.tipsModelRecipes(cubit
                                                  .listModel!
                                                  .result[index]
                                                  .canonicalId
                                                  .substring(
                                                      7,
                                                      cubit
                                                          .listModel!
                                                          .result[index]
                                                          .canonicalId
                                                          .length));
                                            } else {
                                              cubit.getMoreInfoRecipes(cubit
                                                  .listModel!
                                                  .result[index]
                                                  .canonicalId
                                                  .substring(
                                                      12,
                                                      cubit
                                                          .listModel!
                                                          .result[index]
                                                          .canonicalId
                                                          .length));
                                              cubit.tipsModelRecipes(cubit
                                                  .listModel!
                                                  .result[index]
                                                  .canonicalId
                                                  .substring(
                                                      12,
                                                      cubit
                                                          .listModel!
                                                          .result[index]
                                                          .canonicalId
                                                          .length));
                                            }
                                            navigatorPush(
                                                context: context,
                                                widget: Details(
                                                  calories: cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition !=
                                                              null &&
                                                          cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition!
                                                                  .calories !=
                                                              null
                                                      ? cubit
                                                          .listModel!
                                                          .result[index]
                                                          .nutrition!
                                                          .calories
                                                      : "X",
                                                  carbohydrates: cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition !=
                                                              null &&
                                                          cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition!
                                                                  .carbohydrates !=
                                                              null
                                                      ? cubit
                                                          .listModel!
                                                          .result[index]
                                                          .nutrition!
                                                          .carbohydrates
                                                      : "X",
                                                  fat: cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition !=
                                                              null &&
                                                          cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition!
                                                                  .fat !=
                                                              null
                                                      ? cubit
                                                          .listModel!
                                                          .result[index]
                                                          .nutrition!
                                                          .fat
                                                      : "X",
                                                  fiber: cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition !=
                                                              null &&
                                                          cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition!
                                                                  .fiber !=
                                                              null
                                                      ? cubit
                                                          .listModel!
                                                          .result[index]
                                                          .nutrition!
                                                          .fiber
                                                      : "X",
                                                  protein: cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition !=
                                                              null &&
                                                          cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition!
                                                                  .protein !=
                                                              null
                                                      ? cubit
                                                          .listModel!
                                                          .result[index]
                                                          .nutrition!
                                                          .protein
                                                      : "X",
                                                  sugar: cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition !=
                                                              null &&
                                                          cubit
                                                                  .listModel!
                                                                  .result[index]
                                                                  .nutrition!
                                                                  .sugar !=
                                                              null
                                                      ? cubit
                                                          .listModel!
                                                          .result[index]
                                                          .nutrition!
                                                          .sugar
                                                      : "X",
                                                  price: cubit
                                                      .listModel!
                                                      .result[index]
                                                      .price!
                                                      .total,
                                                  image: cubit
                                                      .listModel!
                                                      .result[index]
                                                      .thumbnailUrl,
                                                ));
                                          },
                                          check: cubit.check,
                                          image: cubit.listModel!.result[index]
                                              .thumbnailUrl,
                                          name: cubit
                                              .listModel!.result[index].name,
                                          star: cubit.listModel!.result[index]
                                                          .userRating !=
                                                      null &&
                                                  cubit.listModel!.result[index]
                                                          .userRating!.score !=
                                                      null
                                              ? (cubit.listModel!.result[index]
                                                          .userRating!.score! *
                                                      10)
                                                  .toStringAsFixed(1)
                                              : "--"),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: cubit.listModel!.result.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                )
                              ],
                            ),
                          ),
                        ))
                  : Container());
        },
        listener: (context, state) {});
  }
}
