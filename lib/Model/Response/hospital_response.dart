// To parse this JSON data, do
//
//     final hospitalResponse = hospitalResponseFromJson(jsonString);

import 'dart:convert';

HospitalResponse hospitalResponseFromJson(String str) => HospitalResponse.fromJson(json.decode(str));

String hospitalResponseToJson(HospitalResponse data) => json.encode(data.toJson());

class HospitalResponse {
    String? message;
    List<Hospital>? hospitals;

    HospitalResponse({
         this.message,
         this.hospitals,
    });

    factory HospitalResponse.fromJson(Map<String, dynamic> json) => HospitalResponse(
        message: json["message"],
        hospitals: List<Hospital>.from(json["hospitals"].map((x) => Hospital.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "hospitals": List<dynamic>.from(hospitals!.map((x) => x.toJson())),
    };
}

class Hospital {
    Geometry geometry;
    String? icon;
    String? iconMaskBaseUri;
    String? name;
    OpeningHours? openingHours;
    List<Photo>? photos;
    String? placeId;
    double? rating;
    String? reference;
    int? userRatingsTotal;
    String? vicinity;
    bool? permanentlyClosed;

    Hospital({
        required this.geometry,
         this.icon,
         this.iconMaskBaseUri,
         this.name,
        this.openingHours,
        this.photos,
         this.placeId,
        this.rating,
         this.reference,
        this.userRatingsTotal,
         this.vicinity,
        this.permanentlyClosed,
    });

    factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        geometry: Geometry.fromJson(json["geometry"]),
        icon: json["icon"],
        iconMaskBaseUri: json["icon_mask_base_uri"],
        name: json["name"],
        openingHours: json["opening_hours"] == null ? null : OpeningHours.fromJson(json["opening_hours"]),
        photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        placeId: json["place_id"],
        rating: json["rating"]?.toDouble(),
        reference: json["reference"],
        userRatingsTotal: json["user_ratings_total"],
        vicinity: json["vicinity"],
        permanentlyClosed: json["permanently_closed"],
    );

    Map<String, dynamic> toJson() => {
        "geometry": geometry.toJson(),
        "icon": icon,
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "opening_hours": openingHours?.toJson(),
        "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "place_id": placeId,
        "rating": rating,
        "reference": reference,
        "user_ratings_total": userRatingsTotal,
        "vicinity": vicinity,
        "permanently_closed": permanentlyClosed,
    };
}



class Geometry {
    Location location;
    Viewport viewport;

    Geometry({
        required this.location,
        required this.viewport,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
        viewport: Viewport.fromJson(json["viewport"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "viewport": viewport.toJson(),
    };
}

class Location {
    double lat;
    double lng;

    Location({
        required this.lat,
        required this.lng,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Viewport {
    Location northeast;
    Location southwest;

    Viewport({
        required this.northeast,
        required this.southwest,
    });

    factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json["northeast"]),
        southwest: Location.fromJson(json["southwest"]),
    );

    Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
    };
}

class OpeningHours {
    bool? openNow;

    OpeningHours({
       this.openNow,
    });

    factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
    );

    Map<String, dynamic> toJson() => {
        "open_now": openNow,
    };
}

class Photo {
    int height;
    List<String> htmlAttributions;
    String photoReference;
    int width;

    Photo({
        required this.height,
        required this.htmlAttributions,
        required this.photoReference,
        required this.width,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions: List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
    };
}
