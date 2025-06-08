import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_admin/features/home/cubits/driver_list_cubit/cubit/drivers_list_cubit.dart';
import 'package:loopi_admin/features/home/cubits/driver_register_cubit/cubit/driver_register_cubit.dart';
import 'package:loopi_admin/features/home/widgets/driver_list.dart';
import 'package:loopi_admin/features/home/widgets/register_driver_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Controller Home')),

      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [

                    if(_selectedScreenIndex == 7)
                      BlocProvider(
                        create: (context) => DriversListCubit(),
                        child: DriverList(),
                      ),
                    if (_selectedScreenIndex == 8)
                      BlocProvider(
                        create: (context) => DriverRegisterCubit(),
                        child: RegisterDriverBody(),
                      ),

                    if (_selectedScreenIndex == 0)
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Welcome to Admin Controller',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Select an option from the menu to get started.',
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            // all botton contrroller
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      Text('كل الرحلات '),
                      SizedBox(height: 20),
                      Divider(height: 1, color: Colors.grey),
                      SizedBox(height: 20),
                      Text('الرحلات الجارية'),
                      SizedBox(height: 20),
                      Divider(height: 1, color: Colors.grey),
                      SizedBox(height: 20),
                      Text('الرحلات المكتملة'),
                      SizedBox(height: 20),
                      Divider(height: 1, color: Colors.grey),
                      SizedBox(height: 20),
                      Text('الرحلات الملغاة'),
                      SizedBox(height: 20),
                      Divider(height: 1, color: Colors.grey),
                      SizedBox(height: 20),
                      Text('الرحلات المعلقة'),
                      SizedBox(height: 20),
                      Divider(height: 1, color: Colors.grey),
                      
                      SizedBox(height: 20),
                      Text('رسائل العملاء'),
                      SizedBox(height: 20),
                      Divider(height: 1, color: Colors.grey),
                     
                      SizedBox(height: 20),
                      Text(' رسائل السائقين'),
                      SizedBox(height: 20),
                        Divider(height: 2, color: Colors.black),

                      InkWell(
                        onTap: () {
                          _selectedScreenIndex = 7;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5,
                          ),
                          child: Text(
                            'قائمة السائقين',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 2, color: Colors.black),

                      InkWell(
                        onTap: () {
                          _selectedScreenIndex = 8;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5,
                          ),
                          child: Text(
                            'أضافة سائق جديد',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
