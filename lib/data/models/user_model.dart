// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:prueba_ingreso_ceiba/domain/entities/user.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel extends User {
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  }) : super(
            id: id,
            name: name,
            username: username,
            email: email,
            address: address,
            phone: phone,
            website: website,
            company: company);

  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: AddressModel.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: CompanyModel.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}

class AddressModel extends Address {
  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  }) : super(
            street: street,
            suite: suite,
            city: city,
            zipcode: zipcode,
            geo: geo);

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: GeoModel.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class GeoModel extends Geo {
  GeoModel({
    required this.lat,
    required this.lng,
  }) : super(lat: lat, lng: lng);

  final String lat;
  final String lng;

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class CompanyModel extends Company {
  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  }) : super(name: name, catchPhrase: catchPhrase, bs: bs);

  final String name;
  final String catchPhrase;
  final String bs;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
