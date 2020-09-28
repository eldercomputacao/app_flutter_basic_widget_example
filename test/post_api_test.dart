import 'package:app_flutter_basic_widget_example/aula_12_http_consumo_api/post.dart';
import 'package:app_flutter_basic_widget_example/aula_12_http_consumo_api/post_api.dart';
import 'package:test/test.dart';

void main() {
  test('posts igual a 100', () async {
    final posts = await PostApi.allPost();
    expect(posts.length, equals(100));
  });

  test('post igual a 1', () async {
    final post = await PostApi.getPostId(1);
    expect(post.id, equals(1));
  });

  test('post igual a 100', () async {
    final post = await PostApi.getPostId(100);
    expect(post.id, equals(100));
  });

  test('post igual a null', () async {
    final post = await PostApi.getPostId(101);
    //print(post);
    expect(post, equals(null));
  });

  test('commments do post 4 igual a 5', () async {
    final post = await PostApi.allCommentsPost(1);
    //print(post);
    expect(post.length, equals(5));
  });

  test('save novo post', () async {
    final post = await PostApi.savePost(Post(
      userId: 1,
      id: 10,
      title: 'title',
      body: 'body',
    ));
    print(post);
    expect(post.id, equals(101));
  });

  test('put post', () async {
    final post = await PostApi.putPost(Post(
      userId: 1,
      id: 10,
      title: 'title',
      body: 'body',
    ));
    //print(post);
    expect(post.id, equals(10));
  });

  test('patch post', () async {
    final post = await PostApi.patchPost(Post(
      userId: 1,
      id: 100,
      title: 'title',
      body: 'body',
    ));
    //print(post);
    expect(post.id, equals(100));
  });

  test('delete post', () async {
    final resultado = await PostApi.deletePost(-1);
    print(resultado);
    expect(resultado, equals(true));
  });
}
