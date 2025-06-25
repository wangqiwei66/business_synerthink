import 'package:tiny_weight/app/models/common_model.dart';

class Avatar {
  String? url;
  String? thumbnailUrl;

  Avatar({
    this.url,
    this.thumbnailUrl,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        url: json['url'] as String?,
        thumbnailUrl: json['thumbnail_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'thumbnail_url': thumbnailUrl,
      };
}

class UserInfo {
  String? uid;
  Avatar? avatar;
  String? nickname;
  int? gender;
  String? birthday;
  double? height;
  double? currentWeight;
  double? targetWeight;
  double? waistline;
  String? fitnessGoal;
  String? fitnessRange;
  int? dailyExerciseTime;
  int? activityLevel;
  int? fastingDays;
  int? isVIP;

  UserInfo({
    this.uid,
    this.avatar,
    this.nickname,
    this.gender,
    this.birthday,
    this.height,
    this.currentWeight,
    this.targetWeight,
    this.waistline,
    this.fitnessGoal,
    this.fitnessRange,
    this.dailyExerciseTime,
    this.activityLevel,
    this.fastingDays,
    this.isVIP,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        uid: json['uid'] as String?,
        avatar: json['avatar'] != null
            ? Avatar.fromJson(json['avatar'] as Map<String, dynamic>)
            : null,
        nickname: json['nickname'] as String?,
        gender: json['gender'] as int?,
        birthday: json['birthday'] as String?,
        height: safeCast<double>(json['height']),
        currentWeight: safeCast<double>('current_weight'),
        targetWeight: safeCast<double>('target_weight'),
        waistline: safeCast<double>('waistline'),
        fitnessGoal: json['fitness_goal']?.toString(),
        fitnessRange: json['fitness_range']?.toString(),
        dailyExerciseTime: json['daily_exercise_time'] as int?,
        activityLevel: json['activity_level'] as int?,
        fastingDays: json['fasting_days'] as int?,
        isVIP: json['is_vip'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'avatar': avatar?.toJson(),
        'nickname': nickname,
        'gender': gender,
        'birthday': birthday,
        'height': height,
        'current_weight': currentWeight,
        'target_weight': targetWeight,
        'fitness_goal': fitnessGoal,
        'fitness_range': fitnessRange,
        'daily_exercise_time': dailyExerciseTime,
        'activity_level': activityLevel,
        'fasting_days': fastingDays,
        'is_vip': isVIP,
      };
}
