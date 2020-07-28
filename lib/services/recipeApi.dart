
import 'dart:convert';

import 'package:RecipeApp/helpers/helper.dart';
import 'package:http/http.dart' as http;

class RecipeApi{

  Future<dynamic> loadRecipe(String searchStr) async{
      final url = AppConst.GetUrl.replaceFirst("{0}", searchStr).replaceFirst("{1}", "1").replaceFirst("{2}", "10");
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
