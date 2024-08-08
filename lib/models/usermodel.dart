class UserModel {
  String? firstName;
  String? lastName;
  String? userName;
  String? phoneNumber;
  String? password;

  UserModel({
    this.firstName,
    this.lastName,
    this.userName,
    this.phoneNumber,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    return data;
  }
}
