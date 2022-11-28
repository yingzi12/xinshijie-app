import 'package:equatable/equatable.dart';
//注意：package:equatable用于启用User对象的值比较。
class User extends Equatable {
  const User(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User('-');
}