class LoginResponse {
  String? sId;
  String? accessToken;
  String? refreshToken;

  LoginResponse({this.sId, this.accessToken, this.refreshToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}
