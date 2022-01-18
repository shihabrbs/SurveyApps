import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:survey_flutter_apps/model/survey_item_model.dart';
import 'package:survey_flutter_apps/model/survey_model.dart';
import 'package:survey_flutter_apps/network/ApiClient.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  var surveyItems = [
    {
      "survey_id": 2,
      "name_en": "How was today's meal",
      "name_bn": "আজকের খাবার কেমন ছিল ?",
      "discriptionen_en": "The maps connecting the seas will be replaced in all the educational institutions of Bangladesh.",
      "discriptionbn_bn": "বাংলাদেশের সকল শিক্ষাপ্রতিষ্ঠানে সমুদ্রসীমা সংযুক্ত করা মানচিত্র প্রতিস্থাপন করা হবে।",
      "mode": "radio",
      "survey_item": [
        {
          "id": 1,
          "item_name_en": "Very Good ",
          "item_name_bn": "খুব ভালো ",
          "item_value": "খুব ভালো "
        },
        {
          "id": 2,
          "item_name_en": "Good ",
          "item_name_bn": " ভালো ",
          "item_value": " ভালো "
        },
        {
          "id": 3,
          "item_name_en": "Satisfactory ",
          "item_name_bn": " সন্তোষজনক ",
          "item_value": " সন্তোষজনক "
        },
        {
          "id": 4,
          "item_name_en": "Bad ",
          "item_name_bn": " খারাপ ",
          "item_value": " খারাপ "
        },
        {
          "id": 5,
          "item_name_en": "Very Bad ",
          "item_name_bn": " খুব খারা ",
          "item_value": " খুব খারা "
        }
      ],
      "itemvalueen": "FREE English to Bengali Translation",
      "itemvaluebn": "বিনামূল্যে ইংরেজি থেকে বাংলা অনুবাদ",
      "created_at": "2022-01-17T11:20:13.000000Z",
      "updated_at": "2022-01-17T11:20:13.000000Z"
    },
    {
      "survey_id": 3,
      "name_en": "how was today's water?",
      "name_bn": "আজকের জল কেমন ছিল?",
      "discriptionen_en": "The maps connecting the seas will be replaced in all the educational institutions of Bangladesh.",
      "discriptionbn_bn": "বাংলাদেশের সকল শিক্ষাপ্রতিষ্ঠানে সমুদ্রসীমা সংযুক্ত করা মানচিত্র প্রতিস্থাপন করা হবে।",
      "mode": "radio",
      "survey_item": [
        {
          "id": 1,
          "item_name_en": "Very Good ",
          "item_name_bn": "খুব ভালো ",
          "item_value": "খুব ভালো "
        },
        {
          "id": 2,
          "item_name_en": "Good ",
          "item_name_bn": " ভালো ",
          "item_value": " ভালো "
        },
        {
          "id": 3,
          "item_name_en": "Satisfactory ",
          "item_name_bn": " সন্তোষজনক ",
          "item_value": " সন্তোষজনক "
        },
        {
          "id": 4,
          "item_name_en": "Bad ",
          "item_name_bn": " খারাপ ",
          "item_value": " খারাপ "
        },
        {
          "id": 5,
          "item_name_en": "Very Bad ",
          "item_name_bn": " খুব খারা ",
          "item_value": " খুব খারা "
        }
      ],
      "itemvalueen": "FREE English n",
      "itemvaluebn": "বিনামূল্যে ইংরেজি থেকে বাংলা অনুবাদ",
      "created_at": "2022-01-17T11:20:13.000000Z",
      "updated_at": "2022-01-17T11:20:13.000000Z"
    }
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }





  Widget _buildListPanel(SurveyModel root){
    return ExpansionTile(
      key: PageStorageKey<SurveyModel>(root),
        title: Text(root.nameEn)
      ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      body: /*new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
        //  return new ExpandableListView(title: surveyItems[index]["name_bn"]);
          return new ExpandableListView(title: agentdata[index].nameEn);
        },
        itemCount: agentdata.length,
      )*/
      FutureBuilder(
        future: ApiClient().getSurvey(),

        builder: (BuildContext context,AsyncSnapshot<List<SurveyModel>> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                //  return new ExpandableListView(title: surveyItems[index]["name_bn"]);
                return new ExpandableListView(title: snapshot.data[index].nameEn);
              },
              itemCount: snapshot.data.length,
            );
          }
          else if(snapshot.hasError){
            return Text("We got Error");
          }
          return Center(

          child: CircularProgressIndicator(),

          );
      },
      )

    );
  }


}


class ExpandableListView extends StatefulWidget {
  final String title;

  const ExpandableListView({Key key, this.title}) : super(key: key);

  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  List<IconData> icons = [Icons.person,Icons.home,Icons.add,Icons.camera,Icons.search];

  List<String> imagearrets = ['assets/laughing.png','assets/good.png','assets/neutral.png','assets/bad.png','assets/crying.png'];

  List<Color> color = [Colors.green,Colors.lime,Colors.yellow,Colors.pink,Colors.red];

  List<String> itemsname = ["Very Good","Good","Satisfactory","Bad","Very Bad"];




  var surveyItems = [
    {
      "survey_id": 2,
      "name_en": "How was today's meal",
      "name_bn": "আজকের খাবার কেমন ছিল ?",
      "discriptionen_en": "The maps connecting the seas will be replaced in all the educational institutions of Bangladesh.",
      "discriptionbn_bn": "বাংলাদেশের সকল শিক্ষাপ্রতিষ্ঠানে সমুদ্রসীমা সংযুক্ত করা মানচিত্র প্রতিস্থাপন করা হবে।",
      "mode": "radio",
      "survey_item": [
        {
          "id": 1,
          "item_name_en": "Very Good ",
          "item_name_bn": "খুব ভালো ",
          "item_value": "খুব ভালো "
        },
        {
          "id": 2,
          "item_name_en": "Good ",
          "item_name_bn": " ভালো ",
          "item_value": " ভালো "
        },
        {
          "id": 3,
          "item_name_en": "Satisfactory ",
          "item_name_bn": " সন্তোষজনক ",
          "item_value": " সন্তোষজনক "
        },
        {
          "id": 4,
          "item_name_en": "Bad ",
          "item_name_bn": " খারাপ ",
          "item_value": " খারাপ "
        },
        {
          "id": 5,
          "item_name_en": "Very Bad ",
          "item_name_bn": " খুব খারা ",
          "item_value": " খুব খারা "
        }
      ],
      "itemvalueen": "FREE English to Bengali Translation",
      "itemvaluebn": "বিনামূল্যে ইংরেজি থেকে বাংলা অনুবাদ",
      "created_at": "2022-01-17T11:20:13.000000Z",
      "updated_at": "2022-01-17T11:20:13.000000Z"
    },
    {
      "survey_id": 3,
      "name_en": "how was today's water?",
      "name_bn": "আজকের জল কেমন ছিল?",
      "discriptionen_en": "The maps connecting the seas will be replaced in all the educational institutions of Bangladesh.",
      "discriptionbn_bn": "বাংলাদেশের সকল শিক্ষাপ্রতিষ্ঠানে সমুদ্রসীমা সংযুক্ত করা মানচিত্র প্রতিস্থাপন করা হবে।",
      "mode": "radio",
      "survey_item": [
        {
          "id": 1,
          "item_name_en": "Very Good ",
          "item_name_bn": "খুব ভালো ",
          "item_value": "খুব ভালো "
        },
        {
          "id": 2,
          "item_name_en": "Good ",
          "item_name_bn": " ভালো ",
          "item_value": " ভালো "
        },
        {
          "id": 3,
          "item_name_en": "Satisfactory ",
          "item_name_bn": " সন্তোষজনক ",
          "item_value": " সন্তোষজনক "
        },
        {
          "id": 4,
          "item_name_en": "Bad ",
          "item_name_bn": " খারাপ ",
          "item_value": " খারাপ "
        },
        {
          "id": 5,
          "item_name_en": "Very Bad ",
          "item_name_bn": " খুব খারা ",
          "item_value": " খুব খারা "
        }
      ],
      "itemvalueen": "FREE English n",
      "itemvaluebn": "বিনামূল্যে ইংরেজি থেকে বাংলা অনুবাদ",
      "created_at": "2022-01-17T11:20:13.000000Z",
      "updated_at": "2022-01-17T11:20:13.000000Z"
    }
  ];






  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      child: new Column(
        children: <Widget>[
          InkWell(
            child: new Container(
              color: Colors.grey[200],
              padding: new EdgeInsets.symmetric(horizontal: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                /*  new IconButton(
                      icon: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: new Center(
                          child: new Icon(
                            expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          expandFlag = !expandFlag;
                        });
                      }),*/
                  Container(

                    child:  Column(
                      children: [

                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              widget.title,
                              style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),
                            ),


                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    height: 50,
                  ),

                ],
              ),
            ),
            onTap: (){
              setState(() {
                expandFlag = !expandFlag;
              });
            },
          ),
           ExpandableContainer(
              expanded: expandFlag,
              child: Center(
                child: /*new ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[200]),
                          ),
                          alignment: Alignment.center,
                            height: 90,
                            width: 150,

                            child: Container(

                               child:  Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Image.asset(imagearrets[index],width: 60,height: 60,fit: BoxFit.cover,color: color[index],),
                                  Image.network('https://www.kindpng.com/picc/m/3-35984_transparent-emotion-clipart-transparent-background-happy-emoji-png.png'),
                                   Icon(
                                     icons[index],
                                     size: 35,
                                     color: Colors.red,
                                   ),
                                   SizedBox(height: 10,),
                                   Text(itemsname[index]),
                                 ],
                               ),
                             ),


                        ),
                      ),
                      onTap: (){
                        print("$index");
                      },
                    );
                  },
                  itemCount: 5,
                )*/

                FutureBuilder(
                  future: ApiClient().getSurvey(),

                  builder: (BuildContext context,AsyncSnapshot<List<SurveyModel>> snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          //  return new ExpandableListView(title: surveyItems[index]["name_bn"]);
                         // return new ExpandableListView(title: snapshot.data[index].surveyItem[index].itemNameEn);
                          return
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey[200]),
                                  ),
                                  alignment: Alignment.center,
                                  height: 90,
                                  width: 150,

                                  child: Container(

                                    child:  Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(imagearrets[index],width: 60,height: 60,fit: BoxFit.cover,color: color[index],),
                                         Icon(
                                          icons[index],
                                          size: 35,
                                          color: Colors.red,
                                        ),
                                        SizedBox(height: 10,),
                                        Text(snapshot.data[index].surveyItem[index].itemNameEn),
                                      ],
                                    ),
                                  ),


                                ),
                              ),
                              onTap: (){
                                print("$index");
                              },
                            );
                        },
                        itemCount: 4,
                      );
                    }
                    else if(snapshot.hasError){
                      return Text("We got Error");
                    }
                    return Center(

                      child: CircularProgressIndicator(),

                    );
                  },
                )
                ,
              ),
           )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 150.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
     // curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(color: Colors.white,
            border: new Border.all(width: 1.0, color: Colors.white)),
      ),
    );
  }
}