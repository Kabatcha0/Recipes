import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/components/components.dart';
import 'package:recipes_app/layout/cubit/cubit.dart';
import 'package:recipes_app/layout/cubit/states.dart';
import 'package:recipes_app/models/list_model.dart';
import 'package:recipes_app/shared/style/style.dart';

class Details extends StatelessWidget {
  String image;
  dynamic price;
  dynamic fat;
  dynamic calories;
  dynamic sugar;
  dynamic carbohydrates;
  dynamic fiber;
  dynamic protein;
  Details(
      {super.key,
      required this.image,
      required this.price,
      required this.calories,
      required this.carbohydrates,
      required this.fat,
      required this.fiber,
      required this.protein,
      required this.sugar});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit, RecipesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RecipesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
                padding: const EdgeInsetsDirectional.only(start: 2),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: cubit.check ? Colors.black : Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
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
          body: cubit.tipsModel != null && cubit.getMoreInfo != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 1.2,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        width: double.infinity,
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Price : ${price == "" ? "X" : price}",
                              style: TextStyle(
                                  color: cubit.check
                                      ? Style.background
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Nutrition",
                              style: TextStyle(
                                  color:
                                      cubit.check ? Colors.black : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Builder(builder: (context) {
                              List<dynamic> dynami = [
                                fat,
                                calories,
                                sugar,
                                carbohydrates,
                                fiber,
                                protein
                              ];
                              return ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => nutrition(
                                      check: cubit.check,
                                      nut: dynami[index],
                                      name: cubit.nutrition[index]),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 5,
                                      ),
                                  itemCount: cubit.nutrition.length);
                            }),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Instruction",
                              style: TextStyle(
                                  color:
                                      cubit.check ? Colors.black : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ////////listview.builder instruction

                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => instruction(
                                    index: index,
                                    check: cubit.check,
                                    instruction: cubit.getMoreInfo!
                                        .instructions[index].displayText!),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 5,
                                    ),
                                itemCount:
                                    cubit.getMoreInfo!.instructions.length),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Tips",
                              style: TextStyle(
                                  color:
                                      cubit.check ? Colors.black : Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => tips(
                                  check: cubit.check,
                                  name: cubit
                                      .tipsModel!.result[index].authorName!,
                                  body:
                                      cubit.tipsModel!.result[index].tipBody!),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              itemCount: cubit.tipsModel!.result.length,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
        );
      },
    );
  }
}
