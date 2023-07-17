part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  final List<Post> posts;
  final PostStatus status;

  const PostState(
      {this.posts = const <Post>[], this.status = PostStatus.initial});

  @override
  List<Object?> get props => [posts, status];

  PostState copyWith({List<Post>? posts, PostStatus? status}) {
    return PostState(posts: posts ?? this.posts, status: status ?? this.status);
  }
}
