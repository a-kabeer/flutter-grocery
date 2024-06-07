// import 'package:stacked/stacked.dart';

import 'package:stacked/stacked.dart';

class CountryModel extends BaseViewModel {
  Country _selectedCountry =
      Country(code: 'PK', name: 'Pakistan', phoneCode: '+92');

  final List<Country> _countries = [
    Country(code: 'PK', name: 'Pakistan', phoneCode: '+92'),
    Country(code: 'BD', name: 'Bangladesh', phoneCode: '+880'),
    Country(code: 'US', name: 'United States', phoneCode: '+1'),
    Country(code: 'IN', name: 'India', phoneCode: '+91'),
    Country(code: 'CA', name: 'Canada', phoneCode: '+1'),
    Country(code: 'FR', name: 'France', phoneCode: '+33'),
    Country(code: 'DE', name: 'Germany', phoneCode: '+49'),
  ];

  Country get selectedCountry => _selectedCountry;
  List<Country> get countries => _countries;

  void selectCountry(Country? country) {
    if (country != null) {
      _selectedCountry = country;
      notifyListeners();
    }
  }
}

class Country {
  final String code;
  final String name;
  final String phoneCode;

  Country({
    required this.code,
    required this.name,
    required this.phoneCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name &&
          phoneCode == other.phoneCode;

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ phoneCode.hashCode;
}
