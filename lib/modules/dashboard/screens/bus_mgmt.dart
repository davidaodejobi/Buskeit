// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:buskeit/shared/margin.dart';

import '../../../constant/constant.dart';

class BusMgmt extends StatelessWidget {
  const BusMgmt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final workDays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bus Management'),
        ),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColor.backgroundColor.withOpacity(0.1),
                    AppColor.backgroundColor.withOpacity(0.6),
                  ],
                ),
              ),
              height: 350,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const BusDetailCard(
                          //   color: AppColor.primaryColor,
                          // ),
                          const YMargin(10),
                          const BusDetailCard(
                            color: AppColor.accentColor,
                          ),
                          const YMargin(10),
                          Text(
                            'Name: Jobi David',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Class: Primary 1',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Class: Primary 1',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Class: Primary 1',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: AppColor.backgroundColor,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://picsum.photos/250?image=9'),
                                    fit: BoxFit.fill)),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const YMargin(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Attendance',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          TextSpan(
                              text: ' (Week 1)',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        // color: AppColor.backgroundColor,
                        border: Border.all(
                          color: AppColor.backgroundColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: ['Week 1', 'Week 2', 'Week 3', 'Week 4']
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ).paddingHorizontal(padding: 16),
                const YMargin(10),
                Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: AppColor.backgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Day',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                    text: ' (date)',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(
                          'Status',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ).paddingHorizontal(padding: 16),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColor.backgroundColor.withOpacity(0.1),
                        AppColor.backgroundColor.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      ...List.generate(
                          workDays.length,
                          (i) => SizedBox(
                                  // height: 50,
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: workDays[i],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                      fontSize: 17,
                                                      // fontWeight:
                                                      //     FontWeight.bold,
                                                    ),
                                              ),
                                              TextSpan(
                                                  text: ' (18/11/2022)',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 5, bottom: 3),
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: AppColor.tertiaryColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Picked up',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                  fontSize: 17,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ).paddingLTRB(right: 30),
                                    ],
                                  ).paddingHorizontal(padding: 16),
                                  const Divider(
                                    color: AppColor.primaryColor,
                                    thickness: 1,
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ),
                // const YMargin(10),
              ],
            ),
          ],
        ));
  }
}

class BusDetailCard extends StatelessWidget {
  final Color color;
  const BusDetailCard({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // height: 100,
        padding: const EdgeInsets.all(8),
        // width: ,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 30,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        //glassmorphism
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'No of Day Attended',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ).paddingLTRB(
                              top: 5,
                              bottom: 5,
                            ),
                            Text(
                              '20/90',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3,
                            ).paddingLTRB(
                              top: 5,
                              bottom: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const XMargin(10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'No of Day Attended',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ).paddingLTRB(
                              top: 5,
                              bottom: 5,
                            ),
                            Text(
                              '20/90',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3,
                            ).paddingLTRB(
                              top: 5,
                              bottom: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const YMargin(10),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'No of Day Attended',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ).paddingLTRB(
                              top: 5,
                              bottom: 5,
                            ),
                            Text(
                              '20/90',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3,
                            ).paddingLTRB(
                              top: 5,
                              bottom: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const XMargin(10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'No of Day Attended',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ).paddingLTRB(
                              top: 5,
                              bottom: 5,
                            ),
                            Text(
                              '20/90',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3,
                            ).paddingLTRB(
                              top: 5,
                              bottom: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
