// To parse this JSON data, do
//
//     final stationView = stationViewFromJson(jsonString);

import 'dart:convert';

StationsList stationViewFromJson(String str) => StationsList.fromJson(json.decode(str));

String stationViewToJson(StationsList data) => json.encode(data.toJson());

class StationsList {
    List<Datum>? data;
    int? status;
    String? message;

    StationsList({
        this.data,
        this.status,
        this.message,
    });

    factory StationsList.fromJson(Map<String, dynamic> json) => StationsList(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
        "message": message,
    };
}

class Datum {
    String? uid;
    String? name;
    String? latitude;
    String? longitude;
    String? address;
    String? operatingHours;
    dynamic photo;
    String? contactInfo;
    bool? operationalStatus;
    String? price;
    bool? bookedStatus;

    Datum({
        this.uid,
        this.name,
        this.latitude,
        this.longitude,
        this.address,
        this.operatingHours,
        this.photo,
        this.contactInfo,
        this.operationalStatus,
        this.price,
        this.bookedStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uid: json["uid"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        operatingHours: json["operating_hours"],
        photo: json["photo"],
        contactInfo: json["contact_info"],
        operationalStatus: json["operational_status"],
        price: json["price"],
        bookedStatus: json["booked_status"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "operating_hours": operatingHours,
        "photo": photo,
        "contact_info": contactInfo,
        "operational_status": operationalStatus,
        "price": price,
        "booked_status": bookedStatus,
    };
}
