class CountryList {
  CountryList({
    String? country,
    CountryInfo? countryInfo,
    int? cases,
    int? todayCases,
    int? deaths,
    int? recovered,
    int? todayRecovered,
    int? active,
    int? critical,
    int? tests,
  }) {
    _country = country;
    _countryInfo = countryInfo;
    _cases = cases;
    _todayCases = todayCases;
    _deaths = deaths;
    _recovered = recovered;
    _todayRecovered = todayRecovered;
    _active = active;
    _critical = critical;
    _tests = tests;
  }

  CountryList.fromJson(Map json) {
    _country = json['country'];
    _countryInfo = json['countryInfo'] != null
        ? CountryInfo.fromJson(json['countryInfo'])
        : null;
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _tests = json['tests'];
  }
  String? _country;
  CountryInfo? _countryInfo;
  int? _cases;
  int? _todayCases;
  int? _deaths;
  int? _recovered;
  int? _todayRecovered;
  int? _active;
  int? _critical;
  int? _tests;
  CountryList copyWith({
    int? updated,
    String? country,
    CountryInfo? countryInfo,
    int? cases,
    int? todayCases,
    int? deaths,
    int? recovered,
    int? todayRecovered,
    int? active,
    int? critical,
    int? tests,
  }) =>
      CountryList(
        country: country ?? _country,
        countryInfo: countryInfo ?? _countryInfo,
        cases: cases ?? _cases,
        todayCases: todayCases ?? _todayCases,
        deaths: deaths ?? _deaths,
        recovered: recovered ?? _recovered,
        todayRecovered: todayRecovered ?? _todayRecovered,
        active: active ?? _active,
        critical: critical ?? _critical,
        tests: tests ?? _tests,
      );
  String? get country => _country;
  CountryInfo? get countryInfo => _countryInfo;
  int? get cases => _cases;
  int? get todayCases => _todayCases;
  int? get deaths => _deaths;
  int? get recovered => _recovered;
  int? get todayRecovered => _todayRecovered;
  int? get active => _active;
  int? get critical => _critical;
  int? get tests => _tests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    if (_countryInfo != null) {
      map['countryInfo'] = _countryInfo?.toJson();
    }
    map['cases'] = _cases;
    map['todayCases'] = _todayCases;
    map['deaths'] = _deaths;
    map['recovered'] = _recovered;
    map['todayRecovered'] = _todayRecovered;
    map['active'] = _active;
    map['critical'] = _critical;

    map['tests'] = _tests;
    return map;
  }
}

class CountryInfo {
  CountryInfo({
    int? id,
    String? iso2,
    String? iso3,
    int? lat,
    int? long,
    String? flag,
  }) {
    _flag = flag;
  }

  CountryInfo.fromJson(dynamic json) {
    _flag = json['flag'];
  }
  String? _flag;
  CountryInfo copyWith({
    int? id,
    String? iso2,
    String? iso3,
    int? lat,
    int? long,
    String? flag,
  }) =>
      CountryInfo(
        flag: flag ?? _flag,
      );
  String? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flag'] = _flag;
    return map;
  }
}

// class CountryList {
//   CountryList({
//       dynamic? updated,
//       dynamic? country,
//       CountryInfo? countryInfo,
//       dynamic? cases,
//       dynamic? todayCases,
//       dynamic? deaths,
//     dynamic? todayDeaths,
//     dynamic? recovered,
//     dynamic? todayRecovered,
//     dynamic? active,
//     dynamic? critical,
//     dynamic? casesPerOneMillion,
//     dynamic? deathsPerOneMillion,
//     dynamic? tests,
//     dynamic? testsPerOneMillion,
//     dynamic? population,
//     dynamic? continent,
//     dynamic? oneCasePerPeople,
//     dynamic? oneDeathPerPeople,
//     dynamic? oneTestPerPeople,
//     dynamic? activePerOneMillion,
//     dynamic? recoveredPerOneMillion,
//     dynamic? criticalPerOneMillion,}){
//     _updated = updated;
//     _country = country;
//     _countryInfo = countryInfo;
//     _cases = cases;
//     _todayCases = todayCases;
//     _deaths = deaths;
//     _todayDeaths = todayDeaths;
//     _recovered = recovered;
//     _todayRecovered = todayRecovered;
//     _active = active;
//     _critical = critical;
//     _casesPerOneMillion = casesPerOneMillion;
//     _deathsPerOneMillion = deathsPerOneMillion;
//     _tests = tests;
//     _testsPerOneMillion = testsPerOneMillion;
//     _population = population;
//     _continent = continent;
//     _oneCasePerPeople = oneCasePerPeople;
//     _oneDeathPerPeople = oneDeathPerPeople;
//     _oneTestPerPeople = oneTestPerPeople;
//     _activePerOneMillion = activePerOneMillion;
//     _recoveredPerOneMillion = recoveredPerOneMillion;
//     _criticalPerOneMillion = criticalPerOneMillion;
// }
//
//   CountryList.fromJson(dynamic json) {
//     _updated = json['updated'];
//     _country = json['country'];
//     _countryInfo = json['countryInfo'] != null ? CountryInfo.fromJson(json['countryInfo']) : null;
//     _cases = json['cases'];
//     _todayCases = json['todayCases'];
//     _deaths = json['deaths'];
//     _todayDeaths = json['todayDeaths'];
//     _recovered = json['recovered'];
//     _todayRecovered = json['todayRecovered'];
//     _active = json['active'];
//     _critical = json['critical'];
//     _casesPerOneMillion = json['casesPerOneMillion'];
//     _deathsPerOneMillion = json['deathsPerOneMillion'];
//     _tests = json['tests'];
//     _testsPerOneMillion = json['testsPerOneMillion'];
//     _population = json['population'];
//     _continent = json['continent'];
//     _oneCasePerPeople = json['oneCasePerPeople'];
//     _oneDeathPerPeople = json['oneDeathPerPeople'];
//     _oneTestPerPeople = json['oneTestPerPeople'];
//     _activePerOneMillion = json['activePerOneMillion'];
//     _recoveredPerOneMillion = json['recoveredPerOneMillion'];
//     _criticalPerOneMillion = json['criticalPerOneMillion'];
//   }
//   dynamic? _updated;
//   dynamic? _country;
//   CountryInfo? _countryInfo;
//   dynamic? _cases;
//   dynamic? _todayCases;
//   dynamic? _deaths;
//   dynamic? _todayDeaths;
//   dynamic? _recovered;
//   dynamic? _todayRecovered;
//   dynamic? _active;
//   dynamic? _critical;
//   dynamic? _casesPerOneMillion;
//   dynamic? _deathsPerOneMillion;
//   dynamic? _tests;
//   dynamic? _testsPerOneMillion;
//   dynamic? _population;
//   dynamic? _continent;
//   dynamic? _oneCasePerPeople;
//   dynamic? _oneDeathPerPeople;
//   dynamic? _oneTestPerPeople;
//   dynamic? _activePerOneMillion;
//   dynamic? _recoveredPerOneMillion;
//   dynamic? _criticalPerOneMillion;
// CountryList copyWith({
//   dynamic? updated,
//   dynamic? country,
//   CountryInfo? countryInfo,
//   dynamic? cases,
//   dynamic? todayCases,
//   dynamic? deaths,
//   dynamic? todayDeaths,
//   dynamic? recovered,
//   dynamic? todayRecovered,
//   dynamic? active,
//   dynamic? critical,
//   dynamic? casesPerOneMillion,
//   dynamic? deathsPerOneMillion,
//   dynamic? tests,
//   dynamic? testsPerOneMillion,
//   dynamic? population,
//   dynamic? continent,
//   dynamic? oneCasePerPeople,
//   dynamic? oneDeathPerPeople,
//   dynamic? oneTestPerPeople,
//   dynamic? activePerOneMillion,
//   dynamic? recoveredPerOneMillion,
//   dynamic? criticalPerOneMillion,
// }) => CountryList(  updated: updated ?? _updated,
//   country: country ?? _country,
//   countryInfo: countryInfo ?? _countryInfo,
//   cases: cases ?? _cases,
//   todayCases: todayCases ?? _todayCases,
//   deaths: deaths ?? _deaths,
//   todayDeaths: todayDeaths ?? _todayDeaths,
//   recovered: recovered ?? _recovered,
//   todayRecovered: todayRecovered ?? _todayRecovered,
//   active: active ?? _active,
//   critical: critical ?? _critical,
//   casesPerOneMillion: casesPerOneMillion ?? _casesPerOneMillion,
//   deathsPerOneMillion: deathsPerOneMillion ?? _deathsPerOneMillion,
//   tests: tests ?? _tests,
//   testsPerOneMillion: testsPerOneMillion ?? _testsPerOneMillion,
//   population: population ?? _population,
//   continent: continent ?? _continent,
//   oneCasePerPeople: oneCasePerPeople ?? _oneCasePerPeople,
//   oneDeathPerPeople: oneDeathPerPeople ?? _oneDeathPerPeople,
//   oneTestPerPeople: oneTestPerPeople ?? _oneTestPerPeople,
//   activePerOneMillion: activePerOneMillion ?? _activePerOneMillion,
//   recoveredPerOneMillion: recoveredPerOneMillion ?? _recoveredPerOneMillion,
//   criticalPerOneMillion: criticalPerOneMillion ?? _criticalPerOneMillion,
// );
//   dynamic? get updated => _updated;
//   dynamic? get country => _country;
//   CountryInfo? get countryInfo => _countryInfo;
//   dynamic? get cases => _cases;
//   dynamic? get todayCases => _todayCases;
//   dynamic? get deaths => _deaths;
//   dynamic? get todayDeaths => _todayDeaths;
//   dynamic? get recovered => _recovered;
//   dynamic? get todayRecovered => _todayRecovered;
//   dynamic? get active => _active;
//   dynamic? get critical => _critical;
//   dynamic? get casesPerOneMillion => _casesPerOneMillion;
//   dynamic? get deathsPerOneMillion => _deathsPerOneMillion;
//   dynamic? get tests => _tests;
//   dynamic? get testsPerOneMillion => _testsPerOneMillion;
//   dynamic? get population => _population;
//   dynamic? get continent => _continent;
//   dynamic? get oneCasePerPeople => _oneCasePerPeople;
//   dynamic? get oneDeathPerPeople => _oneDeathPerPeople;
//   dynamic? get oneTestPerPeople => _oneTestPerPeople;
//   dynamic? get activePerOneMillion => _activePerOneMillion;
//   dynamic? get recoveredPerOneMillion => _recoveredPerOneMillion;
//   dynamic? get criticalPerOneMillion => _criticalPerOneMillion;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['updated'] = _updated;
//     map['country'] = _country;
//     if (_countryInfo != null) {
//       map['countryInfo'] = _countryInfo?.toJson();
//     }
//     map['cases'] = _cases;
//     map['todayCases'] = _todayCases;
//     map['deaths'] = _deaths;
//     map['todayDeaths'] = _todayDeaths;
//     map['recovered'] = _recovered;
//     map['todayRecovered'] = _todayRecovered;
//     map['active'] = _active;
//     map['critical'] = _critical;
//     map['casesPerOneMillion'] = _casesPerOneMillion;
//     map['deathsPerOneMillion'] = _deathsPerOneMillion;
//     map['tests'] = _tests;
//     map['testsPerOneMillion'] = _testsPerOneMillion;
//     map['population'] = _population;
//     map['continent'] = _continent;
//     map['oneCasePerPeople'] = _oneCasePerPeople;
//     map['oneDeathPerPeople'] = _oneDeathPerPeople;
//     map['oneTestPerPeople'] = _oneTestPerPeople;
//     map['activePerOneMillion'] = _activePerOneMillion;
//     map['recoveredPerOneMillion'] = _recoveredPerOneMillion;
//     map['criticalPerOneMillion'] = _criticalPerOneMillion;
//     return map;
//   }
//
// }
//
// class CountryInfo {
//   CountryInfo({
//     dynamic? id,
//     dynamic? iso2,
//     dynamic? iso3,
//     dynamic? lat,
//     dynamic? long,
//     dynamic? flag,}){
//     _id = id;
//     _iso2 = iso2;
//     _iso3 = iso3;
//     _lat = lat;
//     _long = long;
//     _flag = flag;
// }
//
//   CountryInfo.fromJson(dynamic json) {
//     _id = json['_id'];
//     _iso2 = json['iso2'];
//     _iso3 = json['iso3'];
//     _lat = json['lat'];
//     _long = json['long'];
//     _flag = json['flag'];
//   }
//   dynamic? _id;
//   dynamic? _iso2;
//   dynamic? _iso3;
//   dynamic? _lat;
//   dynamic? _long;
//   dynamic? _flag;
// CountryInfo copyWith({  int? id,
//   dynamic? iso2,
//   dynamic? iso3,
//   dynamic? lat,
//   dynamic? long,
//   dynamic? flag,
// }) => CountryInfo(  id: id ?? _id,
//   iso2: iso2 ?? _iso2,
//   iso3: iso3 ?? _iso3,
//   lat: lat ?? _lat,
//   long: long ?? _long,
//   flag: flag ?? _flag,
// );
//   dynamic? get id => _id;
//   dynamic? get iso2 => _iso2;
//   dynamic? get iso3 => _iso3;
//   dynamic? get lat => _lat;
//   dynamic? get long => _long;
//   dynamic? get flag => _flag;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = _id;
//     map['iso2'] = _iso2;
//     map['iso3'] = _iso3;
//     map['lat'] = _lat;
//     map['long'] = _long;
//     map['flag'] = _flag;
//     return map;
//   }
//
// }
