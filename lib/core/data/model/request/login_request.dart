import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String? phone;
  final String? password;

  const LoginRequest({this.phone, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }

  @override
  List<Object?> get props => [phone, password];
}
