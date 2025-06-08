import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_admin/features/home/models/driver_model.dart';
import 'package:meta/meta.dart';

part 'drivers_list_state.dart';

class DriversListCubit extends Cubit<DriversListState> {
  DriversListCubit() : super(DriversListInitial());


  getAllDrivers() async {
    emit(DriversListLoading());
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance; 
      QuerySnapshot querySnapshot = await firestore.collection('drivers').get();

      List<DriverModel> drivers = querySnapshot.docs.map((doc) {
        return DriverModel(
          id: doc['id'] ?? '',
          name: doc['name'] ?? '',
          phoneNumber: doc['phone_number'] ?? '',
          address: doc['address'] ?? '',
          fromCity: doc['from_city'] ?? '',
          toCity: doc['to_city'] ?? '',
          plateNumber: doc['plate_number'] ?? '',
          seats: (doc['seats'] as num?)?.toInt() ?? 0,
        );
      }).toList();
      emit(DriversLisSuccess(drivers));
    } catch (e) {
      emit(DriversListFaluire(e.toString()));
    }
  }
}
