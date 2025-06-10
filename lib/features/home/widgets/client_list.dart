import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_admin/features/home/cubits/client_list_cubit/cubit/clint_list_cubit.dart';
import 'package:loopi_admin/features/home/models/client_model.dart';

class ClientList extends StatelessWidget {
  const ClientList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClintListCubit>(context).getAllClint();
    List<ClientModel> clientList = [];
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'قائمة العملاء',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Placeholder for driver list items
            BlocBuilder<ClintListCubit, ClintListState>(
              builder: (context, state) {
                if (state is ClintListLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ClintListFaluire) {
                  return Center(child: Text('خطأ في تحميل العملاء: ${state.errorMessage}'));
                } else if (state is ClintLisSuccess) {
                  clientList = state.clients;
                }
                if (clientList.isEmpty) {
                  return Center(child: Text('لا يوجد عملاء مسجلين'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: clientList.length, // Replace with actual driver count

                    itemBuilder: (context, index) {
                      return ClientItem(
                        clientModel: clientList[index],
                      );
                    },
                  ),
                );
              },
            ),

            // Add more driver items as needed
          ],
        ),
      ),
    );
  }
}

class ClientItem extends StatelessWidget {
  const ClientItem({super.key, required this.clientModel});
  final ClientModel clientModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text('الاسم : ${clientModel.name}')),
          Expanded(
            flex: 1,
            child: Text('رقم الهاتف : ${clientModel.phone}'),
          ),
          Expanded(child: Text('من : ${clientModel.fromCity}')),
          Expanded(child: Text('الي : ${clientModel.toColleage}')),
        //  Expanded(child: Text('المقاعد : ${driverModel.seats}')),
        ],
      ),
    );
  }
}