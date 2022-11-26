import 'package:flutter/cupertino.dart';

class Country {
  int number;
  String image;
  String countryName;
  String CountryCode;

  Country(this.number, this.image, this.countryName, this.CountryCode);

  static List<Country> countrylist() {
    return <Country>[
      Country(
          1,
          'https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f1ea-1f1ec.png',
          'EGYPT',
          'eg'),
      Country(
          2,
          'https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f1fa-1f1f8.png',
          'USA',
          'us'),
    ];
    
  }
}
