// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/modules/dashboard/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../locator.dart';
import '../../../shared/shared.dart';
import '../view_model/dahboard_provider.dart';

StorageService storageService = getIt<StorageService>();

class BaseDashBoard extends StatelessWidget {
  const BaseDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.menu_sharp,
        // ),
        actions: [
          IconButton(
            onPressed: () {
              provider.setHasWorkSpace();
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
      drawer: const DashboardDrawer(),
      body: const Dashboard(),
    );
  }
}

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // DrawerHeader(

            //   child: Text('Drawer Header'),
            // ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/200/300',
                      ),
                    ),
                    const XMargin(16),
                    Text(
                      'Hi John',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ).paddingHorizontal(padding: 16),
            ),
            ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.houseLaptop,
                ),
                title: Text('Dashboard',
                    style: Theme.of(context).textTheme.headline5)),
          ],
        ),
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
              'Enter the details od your school for verification',
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
                  title: 'Last Name',
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
                          builder: (context) => const BaseDashBoard(),
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


/*
Column(
        children: [
          const DashboardHeaderCard(),
          if (provider.hasWorkSpace)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
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
          if (provider.hasWorkSpace)
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
          if (!provider.hasWorkSpace)
            Column(
              children: const [
                YMargin(10),
                FlowSelectCards(),
              ],
            )
        ],
      ),
*/