import 'package:flutter/material.dart';
import 'model_survey.dart';
import 'screen_button.dart';

class survey_list_f extends StatelessWidget {
  List<String> info;

  survey_list_f({this.info});

  @override
  List<Survey> surveys = [
    Survey.fromMap({
      'title': '나이를 입력해 주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '체질량 지수(BMI)를 입력해주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '최고혈압을 입력해주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '최저혈압을 입력해주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '콜레스테롤 수치를 입력해주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '심전도 검사에 대한 결과를 선택해주세요',
      'candidates': [
        '정상',
        '부정맥',
        '협심증, 심근경색 등 허혈성심질환',
        '고혈압으로 생기는 심비대',
        '심장염',
        '전해질대상의 이상',
        '기타',
        '중정도의 고혈압성 변화가 있을때',
        '고도의 고혈압성 변화가 있을 때'
      ],
    }),
    Survey.fromMap({
      'title': '비만도에 대해 선택해주세요',
      'candidates': ['정상', '과체중', '비만'],
    }),
    Survey.fromMap({
      'title': '첫 출산 연령을 입려해주세요',
      'candidates': ['a'],
    }),
    Survey.fromMap({
      'title': '혈당을 입력해주세요(식전)',
      'candidates': ['a'],
    }),
    Survey.fromMap({
      'title': '감마지티피를 입력해주세요',
      'candidates': ['a'],
    }),
    Survey.fromMap({
      'title': '신장(키)을 입력해주세요',
      'candidates': ['a'],
    }),
    Survey.fromMap({
      'title': '간염에 대해 선택해주세요',
      'candidates': ['간염보균자', '면역자', '접종대상'],
    }),
    Survey.fromMap({
      'title': '당뇨병 과거병력이 있는지 선택해주세요',
      'candidates': ['과거병력이 없다.', '과거병력이 있다.'],
    }),
    Survey.fromMap({
      'title': '고혈압 과거병력이 있는지 선택해주세요',
      'candidates': ['과거병력이 없다.', '과거병력이 있다.'],
    }),
    Survey.fromMap({
      'title': '흡연기간에 대해 선택해주세요',
      'candidates': [
        '피우지 않음',
        '5년 미만',
        '5년 이상 10년 미만',
        '10년 이상 20년 미만',
        '20년 이상 30년 미만',
        '30년 이상'
      ],
    }),
    Survey.fromMap({
      'title': '흡연 유무에 대해 선택해주세요',
      'candidates': ['피우지 않는다.', '과거에 피웠으나 지금은 끊었다.', '현재 피우고 있다.'],
    }),
    Survey.fromMap({
      'title': '혈청 지피티에 대해 선택해주세요',
      'candidates': ['혈청지피티 40미만', '혈청지피티 40이상'],
    }),
  ];

  List<Survey_result_list> survey_result_list = [
    Survey_result_list(
      'AG',
      '-1',
    ),
    Survey_result_list(
      'BMI',
      '-1',
    ),
    Survey_result_list(
      'BP_H',
      '-1',
    ),
    Survey_result_list(
      'BP_L',
      '-1',
    ),
    Survey_result_list(
      'CHOL',
      '-1',
    ),
    Survey_result_list(
      'ECG',
      '-1',
    ),
    Survey_result_list(
      'FT',
      '-1',
    ),
    Survey_result_list(
      'FTDV_AG',
      '-1',
    ),
    Survey_result_list(
      'GLU',
      '-1',
    ),
    Survey_result_list(
      'GM_GTP',
      '-1',
    ),
    Survey_result_list(
      'HGT',
      '-1',
    ),
    Survey_result_list(
      'HP_RS',
      '-1',
    ),
    Survey_result_list(
      'P_DM',
      '-1',
    ),
    Survey_result_list(
      'P_HT',
      '-1',
    ),
    Survey_result_list(
      'SM_PR',
      '-1',
    ),
    Survey_result_list(
      'SM_STT',
      '-1',
    ),
    Survey_result_list(
      'SR_GPT_B',
      '-1',
    ),
    Survey_result_list(
      'AG_G',
      '-1',
    ),
    Survey_result_list(
      'BMI_G',
      '-1',
    ),
    Survey_result_list(
      'BP_H_G',
      '-1',
    ),
    Survey_result_list(
      'BP_L_G',
      '-1',
    ),
    Survey_result_list(
      'CHOL_G',
      '-1',
    ),
    Survey_result_list(
      'GLU_G2',
      '-1',
    ),
    Survey_result_list(
      'GM_GTP_G',
      '-1',
    ),
    Survey_result_list(
      'HGT_G',
      '-1',
    ),
  ];

  List<String> answers = new List.generate(25, (i) => '-1',
      growable: true); // 설문에 대한 사용자의 답 저장 (설문의 개수로 지정)

  List<int> answers_int = new List.generate(25, (i) => -1);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: buttonScreen(
        surveys: surveys,
        answers: answers,
        answers_int: answers_int,
        survey_result_list: survey_result_list,
        info: info,
      ),
    );
  }
}

class survey_list_m extends StatelessWidget {
  List<String> info;

  survey_list_m({this.info});

  @override
  List<Survey> surveys = [
    Survey.fromMap({
      'title': '나이를 입력해 주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '최고혈압을 입력해주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '최저혈압을 입력해주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '콜레스테롤 수치를 입력해주세요',
      'candidates': [
        'a',
      ],
    }),
    Survey.fromMap({
      'title': '혈당을 입력해주세요(식전)',
      'candidates': ['a'],
    }),
    Survey.fromMap({
      'title': '감마지티피를 입력해주세요',
      'candidates': ['a'],
    }),
    Survey.fromMap({
      'title': '신장(키)을 입력해주세요',
      'candidates': ['a'],
    }),
    Survey.fromMap({
      'title': '간염에 대해 선택해주세요',
      'candidates': ['간염보균자', '면역자', '접종대상'],
    }),
    Survey.fromMap({
      'title': '당뇨병 과거병력이 있는지 선택해주세요',
      'candidates': ['과거병력이 없다.', '과거병력이 있다.'],
    }),
    Survey.fromMap({
      'title': '고혈압 과거병력이 있는지 선택해주세요',
      'candidates': ['과거병력이 없다.', '과거병력이 있다.'],
    }),
    Survey.fromMap({
      'title': '흡연기간에 대해 선택해주세요',
      'candidates': [
        '5년 미만 (비흡연 포함)',
        '5년 이상 10년 미만',
        '10년 이상 20년 미만',
        '20년 이상 30년 미만',
        '30년 이상'
      ],
    }),
    Survey.fromMap({
      'title': '흡연시작연령에 대해 선택해주세요',
      'candidates': [
        '비흡연자',
        '과거흡연자',
        '흡연시작연령 0년 이상 19년 미만 (고등학생 이하)',
        '흡연시작연령 19년 이상 30년 미만',
        '흡연시작연령 30년 이상 40년 미만',
        '흡연시작연령 40년 이상'
      ],
    }),
    Survey.fromMap({
      'title': '흡연기간에 대해 선택해주세요',
      'candidates': [
        '피우지않음',
        '5년 미만',
        '5년 이상 10년 미만',
        '10년 이상 20년 미만',
        '20년 이상 30년 미만',
        '30년 이상'
      ],
    }),
  ];

  List<Survey_result_list> survey_result_list = [
    Survey_result_list(
      'AG',
      '-1',
    ),
    Survey_result_list(
      'BP_H',
      '-1',
    ),
    Survey_result_list(
      'BP_L',
      '-1',
    ),
    Survey_result_list(
      'CHOL',
      '-1',
    ),
    Survey_result_list(
      'GLU',
      '-1',
    ),
    Survey_result_list(
      'GM_GTP',
      '-1',
    ),
    Survey_result_list(
      'HGT',
      '-1',
    ),
    Survey_result_list(
      'HP_RS',
      '-1',
    ),
    Survey_result_list(
      'P_DM',
      '-1',
    ),
    Survey_result_list(
      'P_HT',
      '-1',
    ),
    Survey_result_list(
      'SM_DR',
      '-1',
    ),
    Survey_result_list(
      'SM_IN_B',
      '-1',
    ),
    Survey_result_list(
      'SM_PR',
      '-1',
    ),
    Survey_result_list(
      'AG_G1',
      '-1',
    ),
    Survey_result_list(
      'BP_H_G',
      '-1',
    ),
    Survey_result_list(
      'BP_L_G',
      '-1',
    ),
    Survey_result_list(
      'CHOL_G',
      '-1',
    ),
    Survey_result_list(
      'GLU_G',
      '-1',
    ),
    Survey_result_list(
      'GM_GTP_G',
      '-1',
    ),
    Survey_result_list(
      'HGT_G',
      '-1',
    ),
  ];

  List<String> answers = new List.generate(20, (i) => '-1',
      growable: true); // 설문에 대한 사용자의 답 저장 (설문의 개수로 지정)

  List<int> answers_int = new List.generate(20, (i) => -1);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: buttonScreen(
          surveys: surveys,
          answers: answers,
          answers_int: answers_int,
          survey_result_list: survey_result_list,
          info: info),
    );
  }
}