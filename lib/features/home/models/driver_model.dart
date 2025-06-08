class DriverModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String address;
  final String fromCity;
  final String toCity;
  final String plateNumber;
  final int seats;
  

  DriverModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.fromCity,
    required this.toCity,
    required this.plateNumber,
    required this.seats,
    
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      fromCity: json['from_city'] as String,
      toCity: json['to_city'] as String,
      plateNumber: json['plate_number'] as String,
      seats: json['seats'] as int,
    

     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'from_city': fromCity,
      'to_city': toCity,
      'plate_number': plateNumber,
      'seats': seats,
    };
  }
}