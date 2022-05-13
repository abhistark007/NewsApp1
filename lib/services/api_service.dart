import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:news_app_1/model/article_model.dart';

// Now lets make the HTTP request services
// this class will allow us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //Lets add an endpoint url, you can check the website documentation
  // and learn about the different endpoint
  // fro this example i am going to use a single endpoint

  final endPointUrl=
  Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=db26d214326844f5a392300e0f634c6e");
  // Now lets create the http request function
  // but first lets import the http packages

  Future<List<Article>> getArticle() async{
    http.Response res=await http.get(endPointUrl);

    //first of all lets check that we got a 200 status code:
    // thiis means that the request was a success
    if(res.statusCode==200){
      Map<String,dynamic> json=jsonDecode(res.body);
      List<dynamic> body=json['articles'];
      // This line will allow us to get the different 
      //articles from thr json file and putting them into a list
      List<Article> articles=
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
    }else{
      throw("Can't get the Articles");
    }

  }

}