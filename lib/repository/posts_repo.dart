import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Posts.dart';
class PostsRepo{
  Future<List<Posts>> fetchPosts() async{
    final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
     var response = await http.get(url);
     if(response.statusCode == 200){
       final json = jsonDecode(response.body);
       return   List<Posts>.from(json.map((result) => Posts.fromJson(result)));
     }else{
       throw Exception('Falha ao buscar dados \n STATUS CODE: ${response.statusCode}');
     }
  }
}

/*
* fazer a implementação dee chamada de api com o dio, já que acima foi feito com o http
* fazer em forma de comentário, desta aula: https://www.youtube.com/watch?v=RqkebzCR3E4&list=PLRpTFz5_57cvo0CHf-AnojOvpznz8YO7S&index=19*/

//dio:

/*
* Future<List<Posts>> fetchPosts() async{
* try{
* var response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
* return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
* } catch(e){
*   throw Exception('Falha ao buscar dados \n STATUS CODE: ${response.statusCode}');
* }
* }
* */