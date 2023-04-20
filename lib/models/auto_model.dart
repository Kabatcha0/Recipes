class AutoModel {
  List<Results> result = [];
  AutoModel.fromJson(Map<String, dynamic> json) {
    json["results"].forEach((e) {
      result.add(Results.fromJson(e));
    });
  }
}

class Results {
  late String display;
  Results.fromJson(Map<String, dynamic> json) {
    display = json["display"];
  }
}
