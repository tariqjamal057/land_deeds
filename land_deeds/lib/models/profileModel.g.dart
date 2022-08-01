// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      username: json['username'] as String? ?? "",
      email: json['email'] as String? ?? "",
      firstname: json['firstname'] as String? ?? "",
      lastname: json['lastname'] as String? ?? "",
      phonenumber: json['phonenumber'] as int? ?? 0,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String? ?? "",
      country: json['country'] as String? ?? "",
      state: json['state'] as String? ?? "",
      city: json['city'] as String? ?? "",
      address: json['address'] as String? ?? "",
      no_of_lands: json['no_of_lands'] as int? ?? 0,
      land_seeled: json['land_seeled'] as int? ?? 0,
      land_buyed: json['land_buyed'] as int? ?? 0,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phonenumber': instance.phonenumber,
      'dob': instance.dob.toIso8601String(),
      'gender': instance.gender,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'no_of_lands': instance.no_of_lands,
      'land_seeled': instance.land_seeled,
      'land_buyed': instance.land_buyed,
    };
