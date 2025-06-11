import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_admin/features/home/models/trip_model.dart';
import 'package:meta/meta.dart';

part 'trips_list_state.dart';

class TripsListCubit extends Cubit<TripsListState> {
  TripsListCubit() : super(TripsListInitial());

  List<String> docIDs = [];
  double allPrice = 0;

  getAllId() async {
    await FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
        docIDs.add(element.id);
      }
    });
  }

  getAllTrips() async {
    await getAllId();
    emit(TripsListLoaded());
    List<TripModel> trips = [];
    try {
      for (var docID in docIDs) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(docID)
            .collection('tikets')
            .get()
            .then((value) {
              for (var element in value.docs) {
                if (element.data()['isAccepted'] == false &&
                    element.data()['isArrived'] == false &&
                    element.data()['isPackUp'] == false) {
                  trips.add(TripModel.fromMap(element.data(), element.id));
                }
              }
            });
      }
      docIDs.clear();
      emit(TripsListSuccess(trips: trips));
    } catch (e) {
      emit(TripsListFaliure(errorMessage: e.toString()));
    }
  }

  getAllTripsRunning() async {
    await getAllId();
    emit(TripsListLoaded());
    List<TripModel> trips = [];
    try {
      for (var docID in docIDs) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(docID)
            .collection('tikets')
            .get()
            .then((value) {
              for (var element in value.docs) {
                if (element.data()['isAccepted'] == true &&
                    element.data()['isArrived'] == false) {
                  trips.add(TripModel.fromMap(element.data(), element.id));
                }
              }
            });
      }
      docIDs.clear();
      emit(TripsListSuccess(trips: trips));
    } catch (e) {
      emit(TripsListFaliure(errorMessage: e.toString()));
    }
  }

  getAllCompleteTrips() async {
    await getAllId();
    emit(TripsListLoaded());
    List<TripModel> trips = [];
    try {
      for (var docID in docIDs) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(docID)
            .collection('tikets')
            .get()
            .then((value) {
              for (var element in value.docs) {
                if (element.data()['isArrived'] == true &&
                    element.data()['isAccepted'] == true &&
                    element.data()['isPackUp'] == true) {
                  trips.add(TripModel.fromMap(element.data(), element.id));
                }
              }
            });
      }
      docIDs.clear();
      emit(TripsListSuccess(trips: trips));
    } catch (e) {
      emit(TripsListFaliure(errorMessage: e.toString()));
    }
  }

  getAllCanceledTrips() async {
    await getAllId();
    emit(TripsListLoaded());
    List<TripModel> trips = [];
    try {
      for (var docID in docIDs) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(docID)
            .collection('tikets')
            .get()
            .then((value) {
              for (var element in value.docs) {
                if (element.data()['isCanceled'] == true) {
                  trips.add(TripModel.fromMap(element.data(), element.id));
                }
              }
            });
      }
    } catch (e) {
      emit(TripsListFaliure(errorMessage: e.toString()));
    }
  }

  toCanceledTrip(String docID, String tripID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(docID)
        .collection('tikets')
        .doc(tripID)
        .update({'isCanceled': true});

    getAllTrips();
  }

  toCompleteTrip(String docID, String tripID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(docID)
        .collection('tikets')
        .doc(tripID)
        .update({'isArrived': true});
    getAllTrips();
  }

  toAccepteTrip(String userID, String tripID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('tikets')
        .doc(tripID)
        .update({'isAccepted': true});
  }

  getAllPriceTrips() async {
    await getAllId();
    emit(TripsListLoaded());
    try {
      for (var docID in docIDs) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(docID)
            .collection('tikets')
            .get()
            .then((value) {
              for (var element in value.docs) {
                if (element.data()['isAccepted'] == true &&
                    element.data()['isArrived'] == true && 
                    element.data()['isPackUp'] == true) {  
                allPrice += element.data()['price'];
              }
              }
            });
      
      }
      emit(TripsPrice(price: allPrice));
    } catch (e) {
      emit(TripsListFaliure(errorMessage: e.toString()));
    }
  }
}
