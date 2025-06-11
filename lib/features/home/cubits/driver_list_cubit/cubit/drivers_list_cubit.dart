import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_admin/features/home/models/client_model.dart';
import 'package:loopi_admin/features/home/models/driver_model.dart';
import 'package:loopi_admin/features/home/models/trip_model.dart';
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
          freeSeats: (doc['free_seats'] as num?)?.toInt() ?? 0,
          driverEmail: doc['email'] ?? '',
        );
      }).toList();
      emit(DriversLisSuccess(drivers));
    } catch (e) {
      emit(DriversListFaluire(e.toString()));
    }
  }

updateSeatsCount({required String driverID}) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore.collection('drivers').doc(driverID).update({
    'free_seats': FieldValue.increment(1),
  });

}
    

  addTicketToDriver({
    required String driverID,
    required String ticketID,
    required TripModel c,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore
          .collection('drivers')
          .doc(driverID)
          .collection('tickets')
          .add({
            'ticket_id': ticketID,
            'client_id': c.userID,
            'client_name': c.userID,
            'client_from_city': c.startLocation,
            'client_to_city': c.endLocation,
            'price' : c.price,
            'isArrived' : c.isArrived,
            'isPackUp' : c.isPackUp,
          });
    } catch (e) {
      emit(DriversListFaluire(e.toString()));
    }
  }
}
