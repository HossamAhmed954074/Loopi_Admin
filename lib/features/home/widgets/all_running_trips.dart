import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:loopi_admin/features/home/cubits/trips_list_cubit/cubit/trips_list_cubit.dart';

import 'package:loopi_admin/features/home/models/trip_model.dart';

class AllRunningTrips extends StatelessWidget {
  const AllRunningTrips({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TripsListCubit>(context).getAllTripsRunning();
    List<TripModel> clientList = [];
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
              'كل الرحلات الجارية',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Placeholder for driver list items
            BlocBuilder<TripsListCubit, TripsListState>(
              builder: (context, state) {
                if (state is TripsListLoaded) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TripsListFaliure) {
                  return Center(
                    child: Text('خطأ في تحميل الرحلات : ${state.errorMessage}'),
                  );
                } else if (state is TripsListSuccess) {
                  clientList = state.trips;
                }
                if (clientList.isEmpty) {
                  return Center(child: Text('لا يوجد رحلات حاليا'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        clientList.length, // Replace with actual driver count

                    itemBuilder: (context, index) {
                      return ClientItem(clientModel: clientList[index]);
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
  final TripModel clientModel;
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('الاسم : ${clientModel.userID}'),
              Text('سعر الرحلة : ${clientModel.price}'),
              Text('من : ${clientModel.startLocation}'),
              Text('الي : ${clientModel.endLocation}'),
              //  Expanded(child: Text('المقاعد : ${driverModel.seats}')),
            ],
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('وصل وجهتة : ${clientModel.isArrived}'),
              Text('تم التقاطة: ${clientModel.isPackUp}'),
              Text(
                'الوقت والتاريخ: ${clientModel.dateTime.toDate().day}/${clientModel.dateTime.toDate().month}/${clientModel.dateTime.toDate().year} ${clientModel.dateTime.toDate().hour}:${clientModel.dateTime.toDate().minute}',
              ),
              Text('قبول الطلب: ${clientModel.isAccepted}'),
            ],
          ),
        ],
      ),
    );
  }
}

