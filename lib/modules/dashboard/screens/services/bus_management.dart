import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/shared.dart';
import '../../widgets/bus_management/bus_overview_card.dart';

class BusManagement extends StatelessWidget {
  const BusManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ],
                ),
              )
            ],
          ),
          //glassmorphism
          Container(
            height: 200,
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
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Text(
                  'The driver is currently in $hashCode',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ).paddingLTRB(top: 10);
              },
            ),
          )
          // )
        ],
      ),
    );
  }
}
