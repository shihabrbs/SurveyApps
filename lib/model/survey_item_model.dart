class SurveyItem {
  int id;
  int surveyId;
  String itemNameEn;
  String itemNameBn;
  String itemValueEn;
  String itemValueBn;

  SurveyItem(
      {this.id,
        this.surveyId,
        this.itemNameEn,
        this.itemNameBn,
        this.itemValueEn,
        this.itemValueBn});

  SurveyItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surveyId = json['survey_id'];
    itemNameEn = json['item_name_en'];
    itemNameBn = json['item_name_bn'];
    itemValueEn = json['item_value_en'];
    itemValueBn = json['item_value_bn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['survey_id'] = this.surveyId;
    data['item_name_en'] = this.itemNameEn;
    data['item_name_bn'] = this.itemNameBn;
    data['item_value_en'] = this.itemValueEn;
    data['item_value_bn'] = this.itemValueBn;
    return data;
  }
}