//مراجعات
class TipsModel {
  List<Results> result = [];
  TipsModel.fromJson(Map<String, dynamic> json) {
    json["results"].forEach((e) {
      result.add(Results.fromJson(e));
    });
  }
}

class Results {
  String? authorName;
  String? tipBody;
  Results.fromJson(Map<String, dynamic> json) {
    authorName = json["author_name"];
    tipBody = json["tip_body"];
  }
}
