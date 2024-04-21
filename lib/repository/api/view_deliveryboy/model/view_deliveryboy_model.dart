// To parse this JSON data, do
//
//     final viewDeliveryboy = viewDeliveryboyFromJson(jsonString);

import 'dart:convert';

ViewDeliveryboyModel viewDeliveryboyFromJson(String str) => ViewDeliveryboyModel.fromJson(json.decode(str));

String viewDeliveryboyToJson(ViewDeliveryboyModel data) => json.encode(data.toJson());

class ViewDeliveryboyModel {
    int? status;
    List<Datum>? data;

    ViewDeliveryboyModel({
        this.status,
        this.data,
    });

    factory ViewDeliveryboyModel.fromJson(Map<String, dynamic> json) => ViewDeliveryboyModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? firstName;
    String? lastName;
    String? phoneNumber;
    String? email;
    String? address;

    Datum({
        this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.address,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "address": address,
    };
}
