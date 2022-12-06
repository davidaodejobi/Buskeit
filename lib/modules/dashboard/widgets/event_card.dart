import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String description;
  const EventCard({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Image.network(
                    'https://picsum.photos/600/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const XMargin(10),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const XMargin(10),
                        ],
                      ),
                      const YMargin(5),
                      Text(
                        dateTime,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const YMargin(10),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const YMargin(10),
      ],
    );
  }
}
