
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'model_post.g.dart';
@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class RestClient{
  factory RestClient(Dio dio)=_RestClient;
  @POST("/{title}")
  Future<List<Post>>getTask(String title);
}
@JsonSerializable()
class Post{
  int albumId;
  int it;
  String title;
  String url;
  String thumbnailUrl;

  Post({required this.albumId, required this.it, required this.title, required this.url, required this.thumbnailUrl});

  factory Post.fromJson(Map<String,dynamic>json)=>_$PostFromJson(json);
  Map<String,dynamic>toJson()=>_$PostToJson(this);
}

