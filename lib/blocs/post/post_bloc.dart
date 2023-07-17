import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/model/post.dart';
import 'package:reddit_clone/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<GetPosts>(_onGetPosts);
  }

  Future<void> _onGetPosts(GetPosts event, Emitter<PostState> emit) async {
    try {
      if (state.status == PostStatus.initial) {
        var response = await PostRepository.getLatestPosts(20);
        var posts = response.map((json) => Post.fromJson(json)).toList();
        return emit(state.copyWith(posts: posts, status: PostStatus.success));
      }

      var response = await PostRepository.getLatestPosts(20);
      var posts = response.map((json) => Post.fromJson(json)).toList();
      emit(state.copyWith(posts: posts, status: PostStatus.success));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
