import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:language_picker/languages.dart';
import 'package:news/models/artical_model.dart';

class API {
  Map<String,String>lang={
    'cairo':'ar'
  };

 // var selectLanguage = 'ca';
  static var  selectLanguagee = Languages.avestan.isoCode;

  final String apiKey = "e6b461d81c444142b8ccfbeca7f885f2";
  Future<List<ArticalesModel>> getDataArticel() async {
    var Url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$selectLanguagee&apiKey=$apiKey");
    List<ArticalesModel> listOfArtical = [];
    var response = await http.get(Url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body)['articles'];
      print(responseBody);
      for (var i in responseBody) {
        ArticalesModel object = ArticalesModel(
            title: i["title"],
            description: i["description"],
            url: i["url"],
            urlToImage: i["urlToImage"]
        );
        listOfArtical.add(object);
      }
      print("listOfArtical$listOfArtical");

    }
    return listOfArtical;
  }

  Future<List<ArticalesModel>> getDataArticelCategories(String category) async {
    var Url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$selectLanguagee&category=$category&apiKey=$apiKey");
    List<ArticalesModel> listOfArticalCa = [];
    var response = await http.get(Url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body)['articles'];
      print(responseBody);
      for (var i in responseBody) {
        ArticalesModel object = ArticalesModel(
            title: i["title"],
            description: i["description"],
            url: i["url"],
            urlToImage: i["urlToImage"]);
        listOfArticalCa.add(object);
      }
      print("listOfArtical$listOfArticalCa");

    }
    return listOfArticalCa;
  }
}