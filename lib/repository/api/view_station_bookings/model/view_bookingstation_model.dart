

class StationbookingModel {
    int? status;
    List<Datum>? data;

    StationbookingModel({
        this.status,
        this.data,
    });

    factory StationbookingModel.fromJson(Map<String, dynamic> json) => StationbookingModel(
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
    int? user;
    UserDetails? userDetails;
    String? chargingStation;
    DateTime? customBookTime;
    String? time;
    double? price;

    Datum({
        this.id,
        this.user,
        this.userDetails,
        this.chargingStation,
        this.customBookTime,
        this.time,
        this.price,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        user: json["user"],
        userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
        chargingStation: json["charging_station"],
        customBookTime: json["custom_book_time"] == null ? null : DateTime.parse(json["custom_book_time"]),
        time: json["time"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "user_details": userDetails?.toJson(),
        "charging_station": chargingStation,
        "custom_book_time": customBookTime?.toIso8601String(),
        "time": time,
        "price": price,
    };
}

class UserDetails {
    int? id;
    String? username;
    String? email;
    String? phoneNumber;

    UserDetails({
        this.id,
        this.username,
        this.email,
        this.phoneNumber,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
    };
}

