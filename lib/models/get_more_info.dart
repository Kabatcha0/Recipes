class GetMoreInfo {
  List<Results> instructions = [];
  GetMoreInfo.fromJson(Map<String, dynamic> json) {
    json["instructions"].forEach((e) {
      instructions.add(Results.fromJson(e));
    });
  }
}

class Results {
  String? displayText;
  Results.fromJson(Map<String, dynamic> json) {
    displayText = json["display_text"];
  }
}
