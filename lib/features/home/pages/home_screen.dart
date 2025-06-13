import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_admin/features/home/cubits/client_list_cubit/cubit/clint_list_cubit.dart';
import 'package:loopi_admin/features/home/cubits/driver_list_cubit/cubit/drivers_list_cubit.dart';
import 'package:loopi_admin/features/home/cubits/driver_register_cubit/cubit/driver_register_cubit.dart';
import 'package:loopi_admin/features/home/cubits/trips_list_cubit/cubit/trips_list_cubit.dart';
import 'package:loopi_admin/features/home/widgets/all_complete_trips.dart';
import 'package:loopi_admin/features/home/widgets/all_running_trips.dart';
import 'package:loopi_admin/features/home/widgets/all_trips.dart';
import 'package:loopi_admin/features/home/widgets/client_list.dart';
import 'package:loopi_admin/features/home/widgets/client_messages_list.dart';
import 'package:loopi_admin/features/home/widgets/driver_list.dart';
import 'package:loopi_admin/features/home/widgets/driver_messages_list.dart';
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(25), // Image radius
                child: Image.asset(
                  'assets/images/loopi.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text('الصفحة الرئيسية لوحدة التحكم الإدارية Loopi'),
          ],
        ),
        backgroundColor: Colors.blueGrey.withAlpha(80),
        centerTitle: true,
        elevation: 0,
      ),

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
                    if (_selectedScreenIndex == 1)
                      MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (context) => TripsListCubit()),
                        ],
                        child: AllTrips(),
                      ),
                    if (_selectedScreenIndex == 2)
                      MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (context) => TripsListCubit()),
                        ],
                        child: AllRunningTrips(),
                      ),
                    if (_selectedScreenIndex == 3)
                      MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (context) => TripsListCubit()),
                        ],
                        child: AllCompleteTrips(),
                      ),

                    if (_selectedScreenIndex == 4) ClientMessagesList(),
                    if (_selectedScreenIndex == 5)
                      BlocProvider(
                        create: (context) => ClintListCubit(),
                        child: ClientList(),
                      ),
                    if (_selectedScreenIndex == 6) DriverMessagesList(),
                    if (_selectedScreenIndex == 7)
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
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(77),
                              child: Image.asset(
                                'assets/images/loopi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'مرحبًا بك في وحدة التحكم الإدارية',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('حدد خيارًا من القائمة للبدء'),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent.withAlpha(80),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        onTap: () {
                          _selectedScreenIndex = 1;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: Text(
                              'كل الرحلات',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 2, color: Colors.black),
                      InkWell(
                        onTap: () {
                          _selectedScreenIndex = 2;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: Text(
                              ' الرحلات الجارية',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 2, color: Colors.black),
                      InkWell(
                        onTap: () {
                          _selectedScreenIndex = 3;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: Text(
                              ' الرحلات المكتملة',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 2, color: Colors.black),

                      InkWell(
                        onTap: () {
                          _selectedScreenIndex = 4;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: Text(
                              'رسائل العملاء ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 2, color: Colors.black),

                      InkWell(
                        onTap: () {
                          _selectedScreenIndex = 5;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: Text(
                              'قائمة العملاء',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 2, color: Colors.black),

                      InkWell(
                        onTap: () {
                          _selectedScreenIndex = 6;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: Text(
                              'رسائل السائقين',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
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
                          child: Center(
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
                          child: Center(
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
