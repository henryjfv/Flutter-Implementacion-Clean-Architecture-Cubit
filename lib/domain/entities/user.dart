import 'package:equatable/equatable.dart';

class User extends Equatable {
    User({
        this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company,
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
        this.street,
        this.suite,
        this.city,
        this.zipcode,
        this.geo,
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
        this.lat,
        this.lng,
    });

    final String lat;
    final String lng;

  @override
  List<Object> get props => [lat, lng];
}

class Company extends Equatable {
    Company({
        this.name,
        this.catchPhrase,
        this.bs,
    });

    final String name;
    final String catchPhrase;
    final String bs;

  @override
  List<Object> get props => [name, catchPhrase, bs];
}
