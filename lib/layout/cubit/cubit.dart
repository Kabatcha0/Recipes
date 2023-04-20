import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/layout/cubit/states.dart';
import 'package:recipes_app/models/auto_model.dart';
import 'package:recipes_app/models/get_more_info.dart';
import 'package:recipes_app/models/list_model.dart' as list;
import 'package:recipes_app/models/tips_model.dart';
import 'package:recipes_app/modules/favorites/favorites.dart';
import 'package:recipes_app/modules/home/home.dart';
import 'package:recipes_app/shared/network/endpoints.dart';
import 'package:recipes_app/shared/network/local/local.dart';
import 'package:recipes_app/shared/network/remote/remote.dart';

class RecipesCubit extends Cubit<RecipesStates> {
  RecipesCubit() : super(RecipesInitialState());
  static RecipesCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void index(int v) {
    currentIndex = v;
    emit(RecipesLayoutState());
  }

  void back() {
    autoModel = null;
    emit(RecipesAutoCompleteBackState());
  }

  List<Widget> screens = [Home(), const Favorites()];
  AutoModel? autoModel;
  void searchAutoComplete({
    required String text,
  }) {
    emit(RecipesAutoCompleteLoadingState());
    if (text != "") {
      DioHelper.getData(
              path: EndPoints.autoCompleteRecipes, key: "prefix", search: text)
          .then((value) {
        autoModel = AutoModel.fromJson(value.data);

        emit(RecipesAutoCompleteSuccessState());
      }).catchError((e) {
        log(e.toString());
      });
    }
  }

  bool check = false;
  void checkMode({bool? mode}) {
    if (mode != null) {
      check = mode;
      emit(RecipesCheckModeState());
    } else {
      check = !check;
      LocalHelper.setBoolMode(key: "TheMode", value: check);
      emit(RecipesCheckModeState());
    }
  }

  list.ListModel? listModel;

  void listModelRecipes() {
    DioHelper.getData(path: EndPoints.recipesList, search: null).then((value) {
      listModel = list.ListModel.fromJson(value.data);
      for (int i = 0; i < listModel!.result.length; i++) {
        favorites.addAll({i: false});
        emit(RecipesListModelRecipestate());
      }
    }).catchError((e) {
      log(e.toString());
    });
  }

  Map<int, bool> favorites = {};
  List<int> indexOfFAV = [];
  List<list.Results> favoritesListModel = [];
  void favoritesDetails({
    required int index,
  }) {
    favorites[index] = !favorites[index]!;
    if (favorites[index] == false) {
      indexOfFAV.remove(index);
      favoritesListModel.remove(listModel!.result[index]);
      emit(RecipesFavoritesModelstate());
    } else {
      indexOfFAV.add(index);
      favoritesListModel.add(listModel!.result[index]);
      emit(RecipesFavoritesModelstate());
    }
  }

  GetMoreInfo? getMoreInfo;
  void getMoreInfoRecipes(String id) {
    DioHelper.getData(path: EndPoints.recipesGetMoreInfo, key: "id", search: id)
        .then((value) {
      getMoreInfo = GetMoreInfo.fromJson(value.data);
      emit(RecipesGetMoreInfostate());
    }).catchError((e) {
      log(e.toString());
    });
  }

  TipsModel? tipsModel;
  void tipsModelRecipes(String id) {
    DioHelper.getData(path: EndPoints.listTips, key: "id", search: id)
        .then((value) {
      tipsModel = TipsModel.fromJson(value.data);
      emit(RecipesTipsModelstate());
    }).catchError((e) {
      log(e.toString());
    });
  }

  List<String> nutrition = [
    "fat",
    "calories",
    "sugar",
    "carbohydrates",
    "fiber",
    "protein"
  ];
}
