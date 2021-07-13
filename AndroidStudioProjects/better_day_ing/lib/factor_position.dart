import 'package:flutter/material.dart';
import 'package:better_day_ing/model_survey.dart';

class factor_position extends StatefulWidget {
  @override
  List<Survey_result_list> survey_result_list = [];
  double num;
  var valname;
  factor_position({this.survey_result_list, this.num, this.valname});
  _factor_positionState createState() => _factor_positionState();
}

class _factor_positionState extends State<factor_position> {
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    var name;
    double max=0;
    if(widget.valname == '혈압') {
      max = 200;
    } else if (widget.valname == '콜레스테롤') {
      max = 260;
    } else if (widget.valname == 'BMI') {
      max = 40;
    } else if (widget.valname == '감마지티피') {
      max = 100;
    } else if (widget.valname == '혈당') {
      max = 200;
    }

    return Padding(padding: EdgeInsets.only(left: (widget.num/max)*width - 25),
        child:  Icon(Icons.person_pin_circle_rounded, size: 50));
  }
}