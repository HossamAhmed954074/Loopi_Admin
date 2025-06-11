import 'package:cloud_firestore/cloud_firestore.dart';

class ClientModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String fromCity;
  final String toColleage;

 

  ClientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.fromCity,
    required this.toColleage,
    
  });

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      fromCity: map['fromCity'] ?? '',
      toColleage: map['toColleage'] ?? '',
      
    );
  }

 
}


