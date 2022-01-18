import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:survey_flutter_apps/model/survey_item_model.dart';
import 'package:survey_flutter_apps/model/survey_model.dart';
import 'package:survey_flutter_apps/utils/Constant.dart';

class ApiClient {


       /* Get getSurvey */
  Future<List<SurveyModel>> getSurvey() async {
    List<SurveyModel> output = [];
    var client = http.Client();
    Iterable dataList;

      var response = await client
          .get(Uri.parse(BASE_URL + endpoint_survey_get), headers: {
        "x-api-key": "survey",
        "x-api-value": "survey@123",
        "x-api-secret": "survey"
      });


      String jsonString = response.body;



      List jsonData = jsonDecode(jsonString);
  //  print(jsonData);
      for (Map<String, dynamic> item in jsonData) {
        output.add(SurveyModel.fromJson(item));
      }

     // print(output);

      return output;
  }






}
