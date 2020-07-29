
import 'dart:convert';

import 'package:RecipeApp/helpers/helper.dart';
import 'package:http/http.dart' as http;

class RecipeApi{

  Future<dynamic> loadRecipe(String searchStr, {String start = "1", String end = "10"}) async{
      final url = AppConst.GetUrl.replaceFirst("{0}", searchStr).replaceFirst("{1}", start).replaceFirst("{2}", end);
      try{
        final response = await http.get(url, headers: {"content-type": "application/json"});
        final jsonResponse = jsonDecode(response.body);
        final hits = jsonResponse["hits"];
        print(hits);
        return hits;
      }catch(e){
        print(e);
      }
  }
}
