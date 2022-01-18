import 'package:survey_flutter_apps/model/survey_item_model.dart';

class SurveyModel {
  int id;
  String nameEn;
  String nameBn;
  String discriptionenEn;
  String discriptionbnBn;
  String mode;
  List<SurveyItem> surveyItem;

  SurveyModel(
      {this.id,
        this.nameEn,
        this.nameBn,
        this.discriptionenEn,
        this.discriptionbnBn,
        this.mode,
        this.surveyItem});

  SurveyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    discriptionenEn = json['discriptionen_en'];
    discriptionbnBn = json['discriptionbn_bn'];
    mode = json['mode'];
    if (json['survey_item'] != null) {
      surveyItem = [];
      json['survey_item'].forEach((v) {
        surveyItem.add(new SurveyItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['discriptionen_en'] = this.discriptionenEn;
    data['discriptionbn_bn'] = this.discriptionbnBn;
    data['mode'] = this.mode;
    if (this.surveyItem != null) {
      data['survey_item'] = this.surveyItem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}