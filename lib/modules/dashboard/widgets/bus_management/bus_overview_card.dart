import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/shared.dart';

class AttendanceTable extends StatelessWidget {
  const AttendanceTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final workDays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Attendance',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                      text: ' (Week 1)',
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: 'Week 1',
                items: ['Week 1', 'Week 2', 'Week 3', 'Week 4']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 0,
        ),
        const YMargin(10),
        const TableHeader(
          title1: 'Day',
          title2: 'Date',
          title3: 'Status',
        ),
        for (var i = 0; i < workDays.length; i++)
          Column(
            children: [
              const Divider(
                height: 0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                color: Colors.white,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        workDays[i],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '12/12/2020',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              value: true,
                              onChanged: (value) {},
                              activeColor: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
              ),
            ],
          ),
      ],
    );
  }
}

class TableHeader extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  const TableHeader({
    Key? key,
    required this.title1,
    required this.title2,
    required this.title3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          color: Colors.white,
          height: 60,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title1,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title2,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      title3,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}

class BusStudentDetail extends StatelessWidget {
  final String title;
  final String value;
  const BusStudentDetail({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:',
          style: Theme.of(context).textTheme.headline5,
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: AppColor.greyColor2,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        )
      ],
    ).paddingBottom();
  }
}

class BusOverviewCard extends StatelessWidget {
  final String title;
  final String count;
  final Color bgColor;
  final Color numColor;
  final Color titleColor;
  const BusOverviewCard({
    Key? key,
    required this.title,
    required this.count,
    required this.bgColor,
    required this.numColor,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColor.greyColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: numColor,
                  fontSize: 50,
                ),
          ),
          const YMargin(10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
