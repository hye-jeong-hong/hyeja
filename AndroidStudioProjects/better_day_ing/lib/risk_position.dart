import 'package:flutter/material.dart';
import 'package:better_day_ing/model_survey.dart';


class risk_position extends StatefulWidget {
  @override

  //double cdf = 0.7;
  List<Survey_result_list> survey_result_list = [];
  var cdfnum;
  risk_position({this.survey_result_list, this.cdfnum});
  _risk_positionState createState() => _risk_positionState();
}

class _risk_positionState extends State<risk_position> {
  @override

  //double cdf = 0.5;


  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    double width = screenSize.width;

    return Padding(padding: EdgeInsets.only(left: (widget.cdfnum*(width-50))), child: Icon(Icons.person_pin_circle_rounded  , size: 50));

  }
// Widget build(BuildContext context) {
//
//   if ((int.parse(widget.survey_result_list[0].v_num)) <= 44){
//     return Padding(padding: const EdgeInsets.only(left: 0.0), child: Icon(Icons.wc_outlined, size: 50));
//   } else if ((int.parse(widget.survey_result_list[0].v_num))<=49){
//     return Padding(padding: const EdgeInsets.only(left: 50.0), child: Icon(Icons.wc_outlined, size: 50));
//   } else if ((int.parse(widget.survey_result_list[0].v_num))<=54){
//     return Padding(padding: const EdgeInsets.only(left: 100.0), child: Icon(Icons.wc_outlined, size: 50));
//   } else if ((int.parse(widget.survey_result_list[0].v_num))<=59){
//     return Padding(padding: const EdgeInsets.only(left: 200.0), child: Icon(Icons.wc_outlined, size: 50));
//   } else if ((int.parse(widget.survey_result_list[0].v_num))<=64) {
//     return Padding(padding: const EdgeInsets.only(left: 280.0), child: Icon(Icons.wc_outlined, size: 50));
//   } else{
//     return Padding(padding: const EdgeInsets.only(left: 310.0), child: Icon(Icons.wc_outlined, size: 50));
//   }
// }
}