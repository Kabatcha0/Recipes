class ListModel {
  List<Results> result = [];

  ListModel.fromJson(Map<String, dynamic> json) {
    json["results"].forEach((e) {
      result.add(Results.fromJson(e));
    });
  }
}

class Results {
  Price? price;
  UserRating? userRating;
  Nutrition? nutrition;
  late String thumbnailUrl;
  late String name;
  late String canonicalId;
  Results.fromJson(Map<String, dynamic> json) {
    price = json["price"] != null ? Price.fromJson(json["price"]) : null;
    userRating = json["user_ratings"] != null
        ? UserRating.fromJson(json["user_ratings"])
        : null;
    nutrition = json["nutrition"] != null
        ? Nutrition.fromJson(json["nutrition"])
        : null;
    thumbnailUrl = json["thumbnail_url"];
    name = json["name"];
    canonicalId = json["canonical_id"];
  }
}

class Price {
  dynamic total;
  Price.fromJson(Map<String, dynamic> json) {
    total = json["total"];
  }
}

class UserRating {
  dynamic score;
  UserRating.fromJson(Map<String, dynamic> json) {
    score = json["score"];
  }
}

class Nutrition {
  dynamic fat;
  dynamic calories;
  dynamic sugar;
  dynamic carbohydrates;
  dynamic fiber;
  dynamic protein;

  Nutrition.fromJson(Map<String, dynamic> json) {
    fat = json["fat"];
    calories = json["calories"];
    sugar = json["sugar"];
    carbohydrates = json["carbohydrates"];
    fiber = json["fiber"];
    protein = json["protein"];
  }
}
