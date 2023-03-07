import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? email;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? gender;
  String? profile;
  String? address;
  String? dob;
  String? phone;
  @JsonKey(name: 'is_active')
  bool? isActive;

  UserModel(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.profile,
      this.address,
      this.dob,
      this.phone,
      this.isActive});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
