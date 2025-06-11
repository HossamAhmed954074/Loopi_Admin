import 'package:cloud_firestore/cloud_firestore.dart';


class TripModel {
  final String startLocation;
  final GeoPoint startPoint;
  final String endLocation;
  final GeoPoint endPoint;
  final Timestamp dateTime;
  final num price;
  final bool isArrived;
  final String tripId;
  final bool isPackUp;
  final bool isAccepted;
  final String userID;


  TripModel({
    required this.startLocation,
    required this.startPoint,
    required this.endLocation,
    required this.endPoint,
    required this.dateTime,
    required this.isArrived,
    required this.price,
    required this.tripId,
    required this.isPackUp,
    required this.isAccepted,
    required this.userID,
  });

  factory TripModel.fromMap( doc , String? id) {
    return TripModel(
      startLocation: doc['startLocation'] ?? '',
      startPoint: doc['startPoint'] ?? GeoPoint(3,2),
      endLocation: doc['endLocation'] ?? '',
      endPoint: doc['endPoint'] ?? GeoPoint(3, 4),
      dateTime: doc['dateTime'] ?? Timestamp(DateTime.august,DateTime.april),
      isArrived: doc['isArrived'] ?? false,
      price: doc['price'] ?? 0,
      tripId: id ?? '',
      isPackUp: doc['isPackUp'] ?? false,
      isAccepted: doc['isAccepted'] ?? false,
      userID: doc['id'] ?? '',

    );
  }
}
