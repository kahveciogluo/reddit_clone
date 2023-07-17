import 'package:dio/dio.dart';
import 'package:reddit_clone/repositories/api_provider.dart';

class PostRepository {

static Future<List<dynamic>> getLatestPosts(int count) async {
  try{
    Response response = await APIProvider().dio.get('top.json?count=$count');
    return response.data['data']['children'];
  }catch(_){
    return [];
  }
}

}
