// // To parse this JSON data, do
// //
// //     final myvehicleModel = myvehicleModelFromJson(jsonString);

// import 'dart:convert';

// MyvehicleModel myvehicleModelFromJson(String str) => MyvehicleModel.fromJson(json.decode(str));

// String myvehicleModelToJson(MyvehicleModel data) => json.encode(data.toJson());

// class MyvehicleModel {
//     int? status;
//     List<Datum>? data;
//     String? message;

//     MyvehicleModel({
//         this.status,
//         this.data,
//         this.message,
//     });

//     factory MyvehicleModel.fromJson(Map<String, dynamic> json) => MyvehicleModel(
//         status: json["status"],
//         data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "message": message,
//     };
// }

// class Datum {
//     String? uid;
//     String? make;
//     String? model;
//     int? year;
//     String? batteryCapacity;
//     int? chargingTime;
//     String? vehicleImage;

//     Datum({
//         this.uid,
//         this.make,
//         this.model,
//         this.year,
//         this.batteryCapacity,
//         this.chargingTime,
//         this.vehicleImage,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         uid: json["uid"],
//         make: json["make"],
//         model: json["model"],
//         year: json["year"],
//         batteryCapacity: json["battery_capacity"],
//         chargingTime: json["charging_time"],
//         vehicleImage: json["vehicle_image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "make": make,
//         "model": model,
//         "year": year,
//         "battery_capacity": batteryCapacity,
//         "charging_time": chargingTime,
//         "vehicle_image": vehicleImage,
//     };
// }
// To parse this JSON data, do
//
//     final myvehicleModel = myvehicleModelFromJson(jsonString);

import 'dart:convert';

MyvehicleModel myvehicleModelFromJson(String str) => MyvehicleModel.fromJson(json.decode(str));

String myvehicleModelToJson(MyvehicleModel data) => json.encode(data.toJson());

class MyvehicleModel {
    int? status;
    List<Datum>? data;
    String? message;

    MyvehicleModel({
        this.status,
        this.data,
        this.message,
    });

    factory MyvehicleModel.fromJson(Map<String, dynamic> json) => MyvehicleModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    String? uid;
    String? make;
    String? model;
    int? year;
    String? batteryCapacity;
    int? chargingTime;
    String? vehicleImage;

    Datum({
        this.uid,
        this.make,
        this.model,
        this.year,
        this.batteryCapacity,
        this.chargingTime,
        this.vehicleImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uid: json["uid"],
        make: json["make"],
        model: json["model"],
        year: json["year"],
        batteryCapacity: json["battery_capacity"],
        chargingTime: json["charging_time"],
        vehicleImage: json["vehicle_image"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "make": make,
        "model": model,
        "year": year,
        "battery_capacity": batteryCapacity,
        "charging_time": chargingTime,
        "vehicle_image": vehicleImage,
    };
}
