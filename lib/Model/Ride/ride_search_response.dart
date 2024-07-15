

class RideSearchResponse {
    bool ok;
    String msg;
    Data data;

    RideSearchResponse({
        required this.ok,
        required this.msg,
        required this.data,
    });

    factory RideSearchResponse.fromJson(Map<String, dynamic> json) => RideSearchResponse(
        ok: json["ok"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    List<Driver> drivers;

    Data({
        required this.drivers,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        drivers: List<Driver>.from(json["drivers"].map((x) => Driver.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "drivers": List<dynamic>.from(drivers.map((x) => x.toJson())),
    };
}

class Driver {
    String driverId;
    int distanceInKm;
    int distanceInM;
    int duration;

    Driver({
        required this.driverId,
        required this.distanceInKm,
        required this.distanceInM,
        required this.duration,
    });

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        driverId: json["driverId"],
        distanceInKm: json["distanceInKm"],
        distanceInM: json["distanceInM"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "driverId": driverId,
        "distanceInKm": distanceInKm,
        "distanceInM": distanceInM,
        "duration": duration,
    };
}
