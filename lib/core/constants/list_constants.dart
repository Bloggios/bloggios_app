/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: list_constants
 */

import 'dart:core';

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

  static final List<CountryPayload> countries = [
    CountryPayload(name: 'India', flag: Flags.india),
    CountryPayload(name: 'USA', flag: Flags.united_states_of_america),
    CountryPayload(name: 'UK', flag: Flags.united_kingdom),
    CountryPayload(name: 'Australia', flag: Flags.australia),
    CountryPayload(name: 'Russia', flag: Flags.russia),
    CountryPayload(name: 'China', flag: Flags.china),
    CountryPayload(name: 'Nepal', flag: Flags.nepal),
    CountryPayload(name: 'UAE', flag: Flags.united_arab_emirates),
  ];

  static final List<String> height = [
    "4' 4\" (132 cm)",
    "4' 5\" (135 cm)",
    "4' 6\" (137 cm)",
    "4' 7\" (140 cm)",
    "4' 8\" (142 cm)",
    "4' 9\" (145 cm)",
    "4' 10\" (147 cm)",
    "4' 11\" (150 cm)",
    "5' 0\" (152 cm)",
    "5' 1\" (155 cm)",
    "5' 2\" (157 cm)",
    "5' 3\" (160 cm)",
    "5' 4\" (163 cm)",
    "5' 5\" (165 cm)",
    "5' 6\" (168 cm)",
    "5' 7\" (170 cm)",
    "5' 8\" (173 cm)",
    "5' 9\" (175 cm)",
    "5' 10\" (178 cm)",
    "5' 11\" (180 cm)",
    "6' 0\" (183 cm)",
    "6' 1\" (185 cm)",
    "6' 2\" (188 cm)",
    "6' 3\" (191 cm)",
    "6' 4\" (193 cm)",
    "6' 5\" (196 cm)",
    "6' 6\" (198 cm)",
    "6' 7\" (201 cm)",
    "6' 8\" (203 cm)",
    "6' 9\" (206 cm)",
    "6' 10\" (208 cm)",
    "6' 11\" (211 cm)",
  ];

  static final List<String> doshType = [
    "Don't have any Dosh",
    "Don't know about it",
    "Manglik",
    "Sarpa Dosham",
    "Kethu Dosham",
    "Kalathra Dosham",
    "Rahu Dosham",
    "Kala Sarpa Dosham"
  ];

  static final List<String> castes = [
    "I do not wish to specify",
    "Brahmin",
    "Ghanchi - Marwari",
    "Modi - Gujrati",
    "Chaudhary - Marwari",
    "Chaurasia",
    "Deshmukh",
    "Garhwali",
    "Mali - Marwari",
    "Gondhali",
    "Gujjar",
    "Sindhi",
    "Suthar",
    "Vaishnav",
    "Naik",
    "Nair",
    "Panchal",
    "Parsi",
    "Patil",
    "Prajapati",
    "Rabari",
    "Sahu",
    "Shaw / Teli",
    "Khatri",
    "Other"
  ];

  static final List<String> disabilityStatus = [
    "No Disability",
    "Physical Disability",
    "Other Disability",
    "Not wish to Specify"
  ];
}

class CountryPayload {
  String name;
  String flag;

  CountryPayload({required this.name, required this.flag});
}