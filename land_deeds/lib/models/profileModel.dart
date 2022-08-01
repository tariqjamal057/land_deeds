import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  String username;
  String email;
  String firstname;
  String lastname;
  int phonenumber;
  DateTime dob;
  String gender;
  String country;
  String state;
  String city;
  String address;
  int no_of_lands;
  int land_seeled;
  int land_buyed;
  ProfileModel({
    this.username = "",
    this.email = "",
    this.firstname = "",
    this.lastname = "",
    this.phonenumber = 0,
    DateTime? dob,
    this.gender = "",
    this.country = "",
    this.state = "",
    this.city = "",
    this.address = "",
    this.no_of_lands = 0,
    this.land_seeled = 0,
    this.land_buyed = 0,
  }) : this.dob = dob ?? DateTime.now();

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
