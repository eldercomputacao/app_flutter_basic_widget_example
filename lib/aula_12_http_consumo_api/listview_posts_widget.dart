import 'package:app_flutter_basic_widget_example/aula_12_http_consumo_api/post.dart';
import 'package:app_flutter_basic_widget_example/aula_12_http_consumo_api/post_api.dart';
import 'package:flutter/material.dart';

class ListViewPostWidget extends StatefulWidget {
  @override
  _ListViewPostWidgetState createState() => _ListViewPostWidgetState();
}

class _ListViewPostWidgetState extends State<ListViewPostWidget> {
  allPost() async {
    await PostApi.allPost();
  }

  getPostId() async {
    await PostApi.getPostId(1);
  }

  allComments() async {
    await PostApi.allCommentsPost(1);
  }

  savePost() async {
    Post post = Post(userId: 10, title: 'title', body: 'body');
    await PostApi.savePost(post);
  }

  deletePost() async {
    await PostApi.deletePost(1).then((value) => print(value));
  }

  putPost() async {
    Post post = Post(id: 1, userId: 10, title: 'title', body: 'body');
    await PostApi.putPost(post).then((value) => print(value));
  }

  patchPost() async {
    Post post = Post(id: 1, userId: 5, title: 'title', body: 'body');
    await PostApi.patchPost(post).then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    allPost();
    //getPostId();
    //allComments();
    //savePost();
    //deletePost();
    //putPost();
    //patchPost();

    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
