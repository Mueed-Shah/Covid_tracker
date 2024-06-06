import 'dart:convert';
import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {

  Future<WorldStatesModel> fetchWorldStateRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateApis));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
  Future<List<dynamic>> fetchCountriesRecord() async {
    final List<dynamic> data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}