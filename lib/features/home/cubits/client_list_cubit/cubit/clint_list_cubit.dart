import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_admin/features/home/models/client_model.dart';
import 'package:meta/meta.dart';

part 'clint_list_state.dart';

class ClintListCubit extends Cubit<ClintListState> {
  ClintListCubit() : super(ClintListInitial());

  getAllClint() async {
    emit(ClintListLoading());

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore.collection('users').get();
      List<ClientModel> drivers = querySnapshot.docs.map((doc) {
        return ClientModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      emit(ClintLisSuccess(drivers));
    } catch (e) {
      emit(ClintListFaluire(e.toString()));
    }
  }
}
