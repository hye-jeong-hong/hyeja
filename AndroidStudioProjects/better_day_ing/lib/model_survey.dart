import 'package:flutter/material.dart';

class Survey {
  String title;
  List<String> candidates;

  Survey({this.title, this.candidates});

  Survey.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        candidates = map['candidates'];

}


class Survey_result_list {
  String variable;
  String v_num;

  Survey_result_list(this.variable, this.v_num);

  // Survey_result_list.fromMap(Map<String, dynamic> map)
  //     : variable = map['variable'],
  //       v_num = map['v_num'];

  Map toJson() => {
    'variable': variable,
    'v_num': v_num,
  };

// Map toJson() => {
//       variable.toString():v_num
//     };


}

class val_risk {
  String title;
  String prove;
  val_risk({this.title, this.prove});

  String smoking = '흡연은 급성췌장염과 만성췌장염의 발병 위험을 모두 높입니다.'
      '덴마크의 한 연구 결과에 따르면 담배를 많이 피우는 사람일수록 췌장암 발병 위험도 함께 높아졌고, '
      '전체 췌장암 발병 케이스의 약 46% 가량이 흡연이 원인인 것으로 추정되었습니다. '
      '흡연은 췌장암 발병의 제 1의 원인입니다. 흡연자가 췌장암에 걸릴 확률은 비흡연자에 비해 2~4배 높습니다.';

  String glucose = '췌장암 환자를 분석한 결과, 발생 위험을 2배 이상 증가시킨 주요 요인은 \'높은 공복혈당\'으로 '
      '나타났습니다. 100mg/dL미만을 기준으로 할 때, 공복혈당이 100~125이면 췌장암 위험이 1.42배, 126이상이면 '
      '2.07배로 증가했습니다.';

  // https://medium.com/@thecodingpapa/json-flutter-61815c214eb8

  Map<String, dynamic> toJson() =>
      {
        'sm' : smoking,
        'glu' : glucose,
      };

  val_risk.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        prove = map['prove'];

}

// class risknum {
//   String risk_num;
//   risknum(this.risk_num);
// }