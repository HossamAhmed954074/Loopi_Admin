import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_admin/features/home/cubits/driver_list_cubit/cubit/drivers_list_cubit.dart';
import 'package:loopi_admin/features/home/models/driver_model.dart';

class DriverList extends StatelessWidget {
  const DriverList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DriversListCubit>(context).getAllDrivers();
    List<DriverModel> driverList = [];
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
              'قائمة السائقين',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Placeholder for driver list items
            BlocBuilder<DriversListCubit, DriversListState>(
              builder: (context, state) {
                if (state is DriversListLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DriversListFaluire) {
                  return Center(child: Text('خطأ في تحميل السائقين: ${state.errorMessage}'));
                } else if (state is DriversLisSuccess) {
                  driverList = state.drivers;
                }
                if (driverList.isEmpty) {
                  return Center(child: Text('لا يوجد سائقين مسجلين'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: driverList.length, // Replace with actual driver count

                    itemBuilder: (context, index) {
                      return DriverItem(
                        driverModel: driverList[index],
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

class DriverItem extends StatelessWidget {
  const DriverItem({super.key, required this.driverModel});
  final DriverModel driverModel;
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
          Expanded(flex: 2, child: Text('الاسم : ${driverModel.name}')),
          Expanded(
            flex: 2,
            child: Text('رقم الهاتف : ${driverModel.phoneNumber}'),
          ),
          Expanded(child: Text('من : ${driverModel.fromCity}')),
          Expanded(child: Text('الي : ${driverModel.toCity}')),
          Expanded(child: Text('المقاعد : ${driverModel.seats}')),
        ],
      ),
    );
  }
}
