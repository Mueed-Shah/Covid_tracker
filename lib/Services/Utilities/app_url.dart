class AppUrl{
  // Base url
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  //fetch world covid states
  static const String worldStateApis = '${baseUrl}all';
  static const String countriesList = '${baseUrl}countries';
}