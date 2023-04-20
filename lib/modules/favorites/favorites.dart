import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/components/components.dart';
import 'package:recipes_app/layout/cubit/cubit.dart';
import 'package:recipes_app/layout/cubit/states.dart';
import 'package:recipes_app/modules/details/details.dart';

class Favorites extends StatelessWidget {
  const Favorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit, RecipesStates>(
        builder: (context, state) {
          var cubit = RecipesCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                leading: Padding(
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
              body: cubit.favoritesListModel.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 12, left: 12, right: 12, bottom: 4),
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => cardOfFavorites(
                              functionFavorites: () {
                                cubit.favoritesDetails(
                                    index: cubit.indexOfFAV[index]);
                              },
                              function: () {
                                if (cubit.favoritesListModel[index].canonicalId
                                    .contains("recipe")) {
                                  cubit.getMoreInfoRecipes(cubit
                                      .favoritesListModel[index].canonicalId
                                      .substring(
                                          7,
                                          cubit.favoritesListModel[index]
                                              .canonicalId.length));
                                  cubit.tipsModelRecipes(cubit
                                      .favoritesListModel[index].canonicalId
                                      .substring(
                                          7,
                                          cubit.favoritesListModel[index]
                                              .canonicalId.length));
                                  navigatorPush(
                                      context: context,
                                      widget: Details(
                                        calories: cubit
                                                        .favoritesListModel[
                                                            index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.calories !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.calories
                                            : "X",
                                        carbohydrates:
                                            cubit.favoritesListModel[index]
                                                            .nutrition !=
                                                        null &&
                                                    cubit
                                                            .favoritesListModel[
                                                                index]
                                                            .nutrition!
                                                            .carbohydrates !=
                                                        null
                                                ? cubit
                                                    .favoritesListModel[index]
                                                    .nutrition!
                                                    .carbohydrates
                                                : "X",
                                        fat: cubit.favoritesListModel[index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.fat !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.fat
                                            : "X",
                                        fiber: cubit.favoritesListModel[index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.fiber !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.fiber
                                            : "X",
                                        protein: cubit.favoritesListModel[index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.protein !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.protein
                                            : "X",
                                        sugar: cubit.favoritesListModel[index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.sugar !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.sugar
                                            : "X",
                                        price: cubit.favoritesListModel[index]
                                            .price!.total,
                                        image: cubit.favoritesListModel[index]
                                            .thumbnailUrl,
                                      ));
                                } else {
                                  cubit.getMoreInfoRecipes(cubit
                                      .favoritesListModel[index].canonicalId
                                      .substring(
                                          12,
                                          cubit.favoritesListModel[index]
                                              .canonicalId.length));
                                  cubit.tipsModelRecipes(cubit
                                      .favoritesListModel[index].canonicalId
                                      .substring(
                                          12,
                                          cubit.favoritesListModel[index]
                                              .canonicalId.length));
                                  navigatorPush(
                                      context: context,
                                      widget: Details(
                                        calories: cubit
                                                        .favoritesListModel[
                                                            index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.calories !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.calories
                                            : "X",
                                        carbohydrates:
                                            cubit.favoritesListModel[index]
                                                            .nutrition !=
                                                        null &&
                                                    cubit
                                                            .favoritesListModel[
                                                                index]
                                                            .nutrition!
                                                            .carbohydrates !=
                                                        null
                                                ? cubit
                                                    .favoritesListModel[index]
                                                    .nutrition!
                                                    .carbohydrates
                                                : "X",
                                        fat: cubit.favoritesListModel[index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.fat !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.fat
                                            : "X",
                                        fiber: cubit.favoritesListModel[index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.fiber !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.fiber
                                            : "X",
                                        protein: cubit.favoritesListModel[index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.protein !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.protein
                                            : "X",
                                        sugar: cubit.favoritesListModel[index]
                                                        .nutrition !=
                                                    null &&
                                                cubit.favoritesListModel[index]
                                                        .nutrition!.sugar !=
                                                    null
                                            ? cubit.favoritesListModel[index]
                                                .nutrition!.sugar
                                            : "X",
                                        price: cubit.favoritesListModel[index]
                                                    .price !=
                                                null
                                            ? cubit.favoritesListModel[index]
                                                .price!.total
                                            : "X",
                                        image: cubit.favoritesListModel[index]
                                            .thumbnailUrl,
                                      ));
                                }
                              },
                              func: cubit.favorites.values
                                  .toList()[cubit.indexOfFAV[index]],
                              src: cubit.favoritesListModel[index].thumbnailUrl,
                              name: cubit.favoritesListModel[index].name,
                              rate:
                                  cubit.favoritesListModel[index].userRating !=
                                              null &&
                                          cubit.favoritesListModel[index]
                                                  .userRating!.score !=
                                              null
                                      ? (cubit.favoritesListModel[index]
                                                  .userRating!.score! *
                                              10)
                                          .toStringAsFixed(1)
                                      : "--"),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 12 / 16,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: cubit.favoritesListModel.length),
                    )
                  : Container());
        },
        listener: (context, state) {});
  }
}
