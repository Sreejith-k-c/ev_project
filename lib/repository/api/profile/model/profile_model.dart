// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    int? status;
    Data? data;

    ProfileModel({
        this.status,
        this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    String? username;
    String? email;
    String? phoneNumber;

    Data({
        this.username,
        this.email,
        this.phoneNumber,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
    };
}
