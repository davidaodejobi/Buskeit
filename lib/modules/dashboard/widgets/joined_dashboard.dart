import 'package:buskeit/constant/helper/helper.dart';
import 'package:buskeit/modules/dashboard/widgets/event_card.dart';
import 'package:flutter/material.dart';

import '../../../shared/margin.dart';
import 'dasgboard_header.dart';

class JoinedDashBoard extends StatelessWidget {
  const JoinedDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DashboardHeaderCard(),
        const YMargin(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Schhol Upcoming Events',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            YMargin(16),
            EventCard(
              title: 'Proffesion Day',
              dateTime: '20/12/2022 | 12:00pm',
              description:
                  'Etiam ut purus mattis mauris sodales aliquam. Aliquam eu nunc. Praesent porttitor, nulla vitae posuere iaculis,',
            ),
            EventCard(
              title: 'Proffesion Day',
              dateTime: '20/12/2022 | 12:00pm',
              description:
                  'Etiam ut purus mattis mauris sodales aliquam. Aliquam eu nunc. Praesent porttitor, nulla vitae posuere iaculis,',
            ),
            EventCard(
              title: 'Proffesion Day',
              dateTime: '20/12/2022 | 12:00pm',
              description:
                  'Etiam ut purus mattis mauris sodales aliquam. Aliquam eu nunc. Praesent porttitor, nulla vitae posuere iaculis,',
            ),
            Text(
              'Deadlines',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            YMargin(16),
            EventCard(
              title: 'Excusion payment',
              dateTime: '20/12/2022 | 12:00pm',
              description:
                  'Parents should kindly note that the excusion payment is due by 20th December 2022',
            ),
            EventCard(
              title: 'School fees payment',
              dateTime: '20/12/2022 | 12:00pm',
              description:
                  'Parents should kindly note that the school fees payment is due by 20th December 2022',
            ),
            EventCard(
              title: 'Christmas hangout',
              dateTime: '20/12/2022 | 12:00pm',
              description:
                  'Parents should kindly note that the Christmas hangout is due by 20th December 2022',
            ),
          ],
        ),
      ],
    ).paddingAll();
  }
}
