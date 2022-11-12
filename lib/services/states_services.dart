import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/country_list.dart';
import '../models/world_states_model.dart';
import 'utilities/app_url.dart';

class StatesServices{

  Future<WorldStatesModel> fetchWorldStatesRecord() async{
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    dynamic data = jsonDecode(response.body.toString());
    print('The data in fectWorld is $data');
    if(response.statusCode == 200){
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }
  List<CountryList> countryList = [];
  Future<List<CountryList>> getAllCountry() async{
    final response = await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    var data = jsonDecode(response.body.toString());

    print('The data in getAllCountry is $data');
    if(response.statusCode == 200){

      for(Map i in data){
        countryList.add(CountryList.fromJson(i));
        // print('The name of the country is ${countryList[0].country}');
      }
      return countryList;
    }else{
      print('The else statement is called');
      return countryList;
    }
  }

}