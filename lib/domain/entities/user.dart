import 'package:equatable/equatable.dart';

class User extends Equatable {
    User({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.phone,
        required this.website,
        required this.company,
    });

    final int id;
    final String name;
    final String username;
    final String email;
    final Address address;
    final String phone;
    final String website;
    final Company company;

  @override
  List<Object> get props => [id, name, username, email, address, phone, website, company];
}

class Address extends Equatable{
    Address({
        required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo,
    });

    final String street;
    final String suite;
    final String city;
    final String zipcode;
    final Geo geo;

  @override
  List<Object> get props => [street, suite, city, zipcode, geo];
}

class Geo extends Equatable {
    Geo({
        required this.lat,
        required this.lng,
    });

    final String lat;
    final String lng;

  @override
  List<Object> get props => [lat, lng];
}

class Company extends Equatable {
    Company({
        required this.name,
        required this.catchPhrase,
        required this.bs,
    });

    final String name;
    final String catchPhrase;
    final String bs;

  @override
  List<Object> get props => [name, catchPhrase, bs];
}
