import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../shared/margin.dart';

class FlowSelection extends StatelessWidget {
  const FlowSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow Selection'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8, 25, 20, 20),
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Are you a School?',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const YMargin(20),
                      Text(
                        'Create a workspace for your school to manage your students and teachers',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const YMargin(20),
                    ],
                  ),
                ),
              ),
              const XMargin(20),
              Expanded(
                child: GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(
                            // name: 'Sign in',
                            ),
                      ),
                    );
                  }),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 25, 8, 20),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Are you a Parent or Guardian?',
                          textAlign: TextAlign.left,
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const YMargin(20),
                        Text(
                          'Join your child\'s school workspace to view their progress, attendance and more',
                          textAlign: TextAlign.left,
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
          // Text(
          //   'Click one of the following options to sign up',
          //   style: Theme.of(context).textTheme.headline5!.copyWith(
          //         color: AppColor.greyColor,
          //       ),
          // ),
          // const YMargin(50),
          // BorderButton(
          //   text: 'Individual',
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const SignUp(
          //           name: 'Individual',
          //         ),
          //       ),
          //     );
          //   },
          // ),
          // ,
          // const YMargin(20),
          // BorderButton(
          //   text: 'School',
          //   onPressed: () {},
          // ),
          // const YMargin(50),
        ],
      ),
    );
  }
}
