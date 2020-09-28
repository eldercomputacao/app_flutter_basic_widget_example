import 'package:app_flutter_basic_widget_example/aula_12_http_consumo_api/comment_post.dart';
import 'package:app_flutter_basic_widget_example/aula_12_http_consumo_api/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PostApi {
  static Future<List<Post>> allPost() async {
    List<Post> posts = [];
    String url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      http.Response response = await http.get(url);
      // print('STATUS CODE : ${response.statusCode}');
      // print('BODY : ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> maps = convert.jsonDecode(response.body);
        posts = maps.map((e) => Post.fromJson(e)).toList();
        // posts.forEach((e) => print(e));
      } else {
        throw Exception(
            'Erro ao ler dos dados -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }

    return posts;
  }

  static Future<Post> getPostId(int idPost) async {
    Post post;
    String url = 'https://jsonplaceholder.typicode.com/posts/$idPost';

    try {
      http.Response response = await http.get(url);
      // print('STATUS CODE : ${response.statusCode}');
      // print('BODY : ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> map = convert.jsonDecode(response.body);
        post = Post.fromJson(map);
        // print(post);
      } else {
        throw Exception(
            'Erro ao ler dos dados -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }

    return post;
  }

  static Future<List<CommentPost>> allCommentsPost(int idPost) async {
    List<CommentPost> commentsPost = [];
    String url = 'https://jsonplaceholder.typicode.com/posts/$idPost/comments';

    try {
      http.Response response = await http.get(url);
      // print('STATUS CODE : ${response.statusCode}');
      // print('BODY : ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> maps = convert.jsonDecode(response.body);
        commentsPost = maps.map((e) => CommentPost.fromJson(e)).toList();
        // commentsPost.forEach((e) => print(e));
      } else {
        throw Exception(
            'Erro ao ler dos dados -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }

    return commentsPost;
  }

  static Future<Post> savePost(Post post) async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      http.Response response = await http.post(
        url,
        //body: convert.jsonEncode(post.toJson()),
        body: convert.jsonEncode({
          'id': post.id,
          'userId': post.userId,
          'title': post.title,
          'body': post.body,
        }),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 201) {
        // print('STATUS CODE : ${response.statusCode}');
        // print('BODY : ${response.body}');
        Map<String, dynamic> map = convert.jsonDecode(response.body);
        return Post.fromJson(map);
      } else {
        throw Exception(
            'Erro ao ler dos dados -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  // Substitui todos os atributos do objeto JSON no servidor
  // Permite substituição de forma total
  static Future<Post> putPost(Post post) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/${post.id}';

    try {
      http.Response response = await http.put(
        url,
        body: convert.jsonEncode({
          //'id': post.id,
          'userId': post.userId,
          'title': post.title,
          'body': post.body,
        }),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> map = convert.jsonDecode(response.body);
        //print(map);
        return Post.fromJson(map);
      } else {
        throw Exception(
            'Erro ao ler dos dados -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  // Substitui todos ou alguns atributos do objeto JSON no servidor
  // Permite substituição de forma total ou parcial
  static Future<Post> patchPost(Post post) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/${post.id}';

    try {
      http.Response response = await http.patch(
        url,
        body: convert.jsonEncode({
          //'id' : post.id,
          'userId': post.userId,
          //'title': post.title,
          'body': post.body,
        }),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> map = convert.jsonDecode(response.body);
        //print(map);
        return Post.fromJson(map);
      } else {
        throw Exception(
            'Erro ao ler dos dados -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  static Future<bool> deletePost(int idPost) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$idPost';

    try {
      http.Response response = await http.delete(
        url,
        //headers: {'Content-type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        // print('STATUS CODE : ${response.statusCode}');
        // print('BODY : ${response.body}');

        return true;
      } else {
        throw Exception(
            'Erro ao ler dos dados -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }

    return false;
  }
}

/*
  DUVIDAS E REFERENCIAS:

  json.decode == jsonDecode
  https://api.dartlang.org/stable/2.2.0/dart-convert/jsonDecode.html

  Serializacao com Bibliotecas
  https://flutter.dev/docs/development/data-and-backend/json

  Conversor JSON
  https://javiercbk.github.io/json_to_dart/
  https://github.com/javiercbk/json_to_dart/issues/16 (BUG Array com Objetos)
  
  Validacao JSON
  https://jsonformatter.curiousconcept.com/

  HTTP Codes
  https://github.com/waldemarnt/http-status-codes
*/
