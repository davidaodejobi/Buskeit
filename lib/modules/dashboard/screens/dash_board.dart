import 'package:buskeit/constant/helper/helper.dart';
import 'package:buskeit/modules/dashboard/screens/bus_mgmt.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';
import '../widgets/flow_select_cards.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_sharp,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 35,
                width: 35,
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        title: const Text('Buskeit'),
      ),
      body: Column(
        children: [
          const DashboardHeaderCard(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppColor.accentColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColor.greyColor.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              'School Board',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusMgmt(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.greyColor.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(3, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Image.network(
                                    'https://picsum.photos/200/300',
                                    fit: BoxFit.cover,
                                    height: double.infinity,
                                    width: double.infinity,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        'Bus Mgmt',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
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
                  );
                }).paddingSymmetric(horizontal: 10),
          ),
          if (false) const FlowSelectCards()
        ],
      ),
    );
  }
}

class DashboardHeaderCard extends StatelessWidget {
  const DashboardHeaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      // width: 100,
      decoration: const BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.all(20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome back,',
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 16,
              ),
            ),
            YMargin(10),
            Text(
              'John Doe',
              style: TextStyle(
                // color: AppColor.blackColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            YMargin(10),
            Text(
              'Select a flow to continue',
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SchoolVerification1 extends StatelessWidget {
  const SchoolVerification1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('School Verification'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your details',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: AppColor.greyColor,
                  ),
            ),
            const YMargin(30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWithHeader(
                  controller: TextEditingController(),
                  title: 'First Name',
                  hintText: 'John',
                ),
                const YMargin(16),
                TextFieldWithHeader(
                  controller: TextEditingController(),
                  title: 'Lastname',
                  hintText: 'Doe',
                ),
              ],
            ),
            const YMargin(16),
            TextFieldWithHeader(
              controller: TextEditingController(),
              title: 'Phone Number',
              hintText: '+23412345678',
            ),
            const YMargin(20),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashBoard(),
                        ),
                      );
                    },
                    child: Text(
                      'Create my account',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                          ),
                    ))),
            const YMargin(20),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 16,
        ));
  }
}
