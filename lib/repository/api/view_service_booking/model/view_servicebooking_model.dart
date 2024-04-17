// To parse this JSON data, do
//
//     final servicebookingModel = servicebookingModelFromJson(jsonString);

import 'dart:convert';

ServicebookingModel servicebookingModelFromJson(String str) => ServicebookingModel.fromJson(json.decode(str));

String servicebookingModelToJson(ServicebookingModel data) => json.encode(data.toJson());

class ServicebookingModel {
    int? status;
    List<Datum>? data;

    ServicebookingModel({
        this.status,
        this.data,
    });

    factory ServicebookingModel.fromJson(Map<String, dynamic> json) => ServicebookingModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? email;
    String? chargingStationName;
    DateTime? customBookTime;
    String? time;
    bool? needDeliveryBoy;

    Datum({
        this.email,
        this.chargingStationName,
        this.customBookTime,
        this.time,
        this.needDeliveryBoy,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        email: json["email"],
        chargingStationName: json["charging_station_name"],
        customBookTime: json["custom_book_time"] == null ? null : DateTime.parse(json["custom_book_time"]),
        time: json["time"],
        needDeliveryBoy: json["need_delivery_boy"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "charging_station_name": chargingStationName,
        "custom_book_time": customBookTime?.toIso8601String(),
        "time": time,
        "need_delivery_boy": needDeliveryBoy,
    };
}
