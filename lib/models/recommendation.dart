class RecommendationModel {
  int? foodID;
  int? index;
  String? name;
  String? cType;
  String? vegNon;
  String? describe;
  String? soup;

  RecommendationModel(
      {this.foodID,
      this.index,
      this.name,
      this.cType,
      this.vegNon,
      this.describe,
      this.soup});

  RecommendationModel.fromJson(Map<String, dynamic> json) {
    foodID = json['Food_ID'];
    index = json['index'];
    name = json['Name'];
    cType = json['C_Type'];
    vegNon = json['Veg_Non'];
    describe = json['Describe'];
    soup = json['soup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Food_ID'] = this.foodID;
    data['index'] = this.index;
    data['Name'] = this.name;
    data['C_Type'] = this.cType;
    data['Veg_Non'] = this.vegNon;
    data['Describe'] = this.describe;
    data['soup'] = this.soup;
    return data;
  }
}
