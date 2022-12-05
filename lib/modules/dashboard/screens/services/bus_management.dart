import 'dart:developer';

import 'package:buskeit/core/core.dart';
import 'package:buskeit/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/shared.dart';
import '../../view_model/bus_mgmt_controller.dart';
import '../../widgets/bus_management/bus_overview_card.dart';

class BusManagement extends StatefulWidget {
  const BusManagement({Key? key}) : super(key: key);

  @override
  State<BusManagement> createState() => _BusManagementState();
}

class _BusManagementState extends State<BusManagement> {
  final location = Location();
  LocationService locationService = getIt<LocationService>();
  // Timer? timer;

  @override
  void initState() {
    location.initState();
    locationService.getPermission();
    super.initState();
  }

  @override
  void dispose() {
    // location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    locationService.getCurrentPosition();
    final busMgmtProvider = Provider.of<BusMgmtProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Management'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Child 1'),
              ),
              const PopupMenuItem(
                child: Text('Child 2'),
              ),
            ];
          })
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 150,
                child: Row(
                  children: const [
                    Expanded(
                      child: BusOverviewCard(
                        bgColor: AppColor.primaryColor,
                        title: 'Total Picked',
                        count: '100',
                        numColor: Colors.white,
                        titleColor: Colors.white,
                      ),
                    ),
                    XMargin(10),
                    Expanded(
                      child: BusOverviewCard(
                        bgColor: Colors.white,
                        title: 'Absents',
                        count: '05',
                        numColor: AppColor.accentColor,
                        titleColor: Colors.black,
                      ),
                    ),
                    XMargin(10),
                    Expanded(
                      child: BusOverviewCard(
                        bgColor: Colors.white,
                        title: 'Total Days',
                        count: '105',
                        numColor: AppColor.primaryColor,
                        titleColor: Colors.black,
                      ),
                    ),
                  ],
                ).paddingLTRB(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
              ),
              const YMargin(20),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: const [
                        BusStudentDetail(
                          title: 'Name',
                          value: 'John Doe',
                        ),
                        BusStudentDetail(
                          title: 'Class',
                          value: 'Grade 1',
                        ),
                        BusStudentDetail(
                          title: 'Department',
                          value: 'Science',
                        ),
                        YMargin(10),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                    const AttendanceTable(),
                    const YMargin(70),
                  ],
                ),
              )
            ],
          ),
          //glassmorphism
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: busMgmtProvider.location ? 200 : 0,
            padding: const EdgeInsets.only(
              top: 10,
              right: 16,
              left: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white10.withAlpha(80)),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColor.greyColor3.withAlpha(100),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ],
              color: Colors.white.withOpacity(0.2),
            ),
            child: StreamBuilder(
              stream: location.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else {
                  log('snapshot.data: ${snapshot.data}');
                  return Text(
                    'The driver is currently in ${snapshot.data}',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ).paddingLTRB(top: 10);
                }
              },
            ),
            // ListView.builder(
            //   itemCount: 10,
            //   itemBuilder: (context, index) {
            //     return Text(
            //       'The driver is currently in $hashCode',
            //       style: Theme.of(context).textTheme.headline5!.copyWith(
            //             fontWeight: FontWeight.w500,
            //           ),
            //     ).paddingLTRB(top: 10);
            //   },
            // ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                locationService.getCurrentPosition().then(
                      (value) => busMgmtProvider.toggleLocation(),
                    );
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyColor.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColor.accentColor,
                    ),
                    const XMargin(10),
                    Text(
                      'Current Location',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
