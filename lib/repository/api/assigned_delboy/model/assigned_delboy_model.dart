// To parse this JSON data, do
//
//     final assignedDeliveryboyModel = assignedDeliveryboyModelFromJson(jsonString);

import 'dart:convert';

AssignedDeliveryboyModel assignedDeliveryboyModelFromJson(String str) => AssignedDeliveryboyModel.fromJson(json.decode(str));

String assignedDeliveryboyModelToJson(AssignedDeliveryboyModel data) => json.encode(data.toJson());

class AssignedDeliveryboyModel {
    int? status;
    List<Datum>? data;

    AssignedDeliveryboyModel({
        this.status,
        this.data,
    });

    factory AssignedDeliveryboyModel.fromJson(Map<String, dynamic> json) => AssignedDeliveryboyModel(
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
    String? username;
    String? deliveryboyName;
    String? destinationAddress;
    String? deliveryStatus;
    String? phoneNumber;

    Datum({
        this.id,
        this.username,
        this.deliveryboyName,
        this.destinationAddress,
        this.deliveryStatus,
        this.phoneNumber,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        username: json["username"],
        deliveryboyName: json["deliveryboy_name"],
        destinationAddress: json["destination_address"],
        deliveryStatus: json["delivery_status"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "deliveryboy_name": deliveryboyName,
        "destination_address": destinationAddress,
        "delivery_status": deliveryStatus,
        "phone_number": phoneNumber,
    };
}
