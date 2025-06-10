import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'driver_register_state.dart';

class DriverRegisterCubit extends Cubit<DriverRegisterState> {
  DriverRegisterCubit() : super(DriverRegisterInitial());

  Future<void> registerDriver({
    required String email,
    required String password,
    required String id,
    required String name,
    required String phoneNumber,
    required String address,
    required String fromCity,
    required String toCity,
    required String plateNumber,
    required int seats,
    required String? image,
  }) async {
    emit(DriverRegisterLoading());

    try {
       await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('drivers').doc(email).set({
        'id': id,
        'name': name,
        'phone_number': phoneNumber,
        'address': address,
        'from_city': fromCity,
        'to_city': toCity,
        'plate_number': plateNumber,
        'seats': seats,
        'driver_image': image ?? '1BzVYUDJCilePhXHGfaUAifcsZZwOIaKE',
      });

      emit(DriverRegisterSuccess());
    } catch (e) {
      emit(DriverRegisterFailure(e.toString()));
    }
  }
}
