import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? gender;
  final String? status;

  const User({this.id, this.name, this.email, this.gender, this.status});
  //TODO:: convert json to dart
  factory User.usersFromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      status: json['status'] as String?,
    );
  }
  //TODO:: convert dart to json
  Map<String, dynamic> usersToJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [id, name, email, gender, status];
}
