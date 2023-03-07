// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as String?,
      profile: json['profile'] as String?,
      address: json['address'] as String?,
      dob: json['dob'] as String?,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'profile': instance.profile,
      'address': instance.address,
      'dob': instance.dob,
      'phone': instance.phone,
      'is_active': instance.isActive,
    };
