import 'check_detail_resp_vo_list.dart';
import 'check_resp_vo.dart';

class SecurityCheckDetailModel {
  CheckRespVo? checkRespVo;
  List<CheckDetailRespVoList>? checkDetailRespVoList;

  SecurityCheckDetailModel({this.checkRespVo, this.checkDetailRespVoList});

  factory SecurityCheckDetailModel.fromJson(Map<String, dynamic> json) {
    return SecurityCheckDetailModel(
      checkRespVo: json['checkRespVO'] == null
          ? null
          : CheckRespVo.fromJson(json['checkRespVO'] as Map<String, dynamic>),
      checkDetailRespVoList: (json['checkDetailRespVOList'] as List<dynamic>?)
          ?.map(
              (e) => CheckDetailRespVoList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'checkRespVO': checkRespVo?.toJson(),
        'checkDetailRespVOList':
            checkDetailRespVoList?.map((e) => e.toJson()).toList(),
      };
}
