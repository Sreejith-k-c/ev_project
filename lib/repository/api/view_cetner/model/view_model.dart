// To parse this JSON data, do
//
//     final viewCenter = viewCenterFromJson(jsonString);

import 'dart:convert';

ViewCenter viewCenterFromJson(String str) => ViewCenter.fromJson(json.decode(str));

String viewCenterToJson(ViewCenter data) => json.encode(data.toJson());

class ViewCenter {
    List<Datum>? data;
    String? message;

    ViewCenter({
        this.data,
        this.message,
    });

    factory ViewCenter.fromJson(Map<String, dynamic> json) => ViewCenter(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    int? id;
    String? name;
    String? address;
    String? phoneNumber;
    String? email;
    String? servicesOffered;
    bool? needDeliveryBoy;
    String? price;

    Datum({
        this.id,
        this.name,
        this.address,
        this.phoneNumber,
        this.email,
        this.servicesOffered,
        this.needDeliveryBoy,
        this.price,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        servicesOffered: json["services_offered"],
        needDeliveryBoy: json["need_delivery_boy"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
        "email": email,
        "services_offered": servicesOffered,
        "need_delivery_boy": needDeliveryBoy,
        "price": price,
    };
}
