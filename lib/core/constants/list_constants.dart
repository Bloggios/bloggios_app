/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: list_constants
 */

import 'package:icons_plus/icons_plus.dart';

class ListConstants {

  static List<String> getRelativeEmailRules(String relation) {
    return [
      "An email containing a 6-digit OTP will be sent to your $relation's registered email address for authentication.",
      "Your $relation will hold primary access to this profile upon successful verification.",
      "Bloggios reserves the right to request proof of the relationship mentioned above for validation purposes.",
      "Ensure that your $relation either has an account associated with this email address or creates one in the future to maintain access to this profile.",
    ];
  }

  static List<CountryPayload> countries = [
    CountryPayload(name: 'India', flag: Flags.india),
    CountryPayload(name: 'USA', flag: Flags.united_states_of_america),
    CountryPayload(name: 'UK', flag: Flags.united_kingdom),
    CountryPayload(name: 'Australia', flag: Flags.australia),
    CountryPayload(name: 'Russia', flag: Flags.russia),
    CountryPayload(name: 'China', flag: Flags.china),
    CountryPayload(name: 'Nepal', flag: Flags.nepal),
    CountryPayload(name: 'UAE', flag: Flags.united_arab_emirates),
  ];
}

class CountryPayload {
  String name;
  String flag;

  CountryPayload({required this.name, required this.flag});
}