import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loopi_admin/features/home/models/message_model.dart';
import 'package:meta/meta.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  getDate({required String auth}) {
    final CollectionReference messages = FirebaseFirestore.instance
        .collection('drivers')
        .doc(auth)
        .collection('messages');

    messages.orderBy('kCreatedAt', descending: true).snapshots().listen((
      event,
    ) {
      List<MessageModel> list = [];
      for (var doc in event.docs) {
        list.add(MessageModel.fromJson(doc));
      }
      emit(MessageLoaded(messages: list));
    });
  }

  getAllDate() async {
    emit(MessageAllDriverLoading());

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore.collection('drivers').get();

      List<String> drivers = querySnapshot.docs.map((doc) {
        return doc.id;
      }).toList();
      emit(MessageAllDriverSuccess(allDrivermessages: drivers));
    } catch (e) {
      emit(MessageAllDriverFaluire(erroeMessages: e.toString()));
    }
  }

  postMessageData({
    required String message,
    required String auth,
    required driverdoc,
  }) {
    final CollectionReference messages = FirebaseFirestore.instance
        .collection('drivers')
        .doc(driverdoc)
        .collection('messages');
    messages.add({
      'kMessage': message,
      'kCreatedAt': DateTime.now().toString(),
      'Id': auth,
    });
  }
}
