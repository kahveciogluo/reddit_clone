import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Post extends Equatable {
	final String? kind;
	final dynamic data;

	const Post({required this.kind,required this.data});

	factory Post.fromJson(Map<String, dynamic> json) => Post(
      kind: json['kind'],
      data: json['data']
    );
	

  @override
  List<Object?> get props => [kind, data];
}



