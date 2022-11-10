// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/constant/helper/helper.dart';
import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../shared/shared.dart';
import '../Auth/sign_up/sign_up.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Scaffold(
        // persistentFooterButtons: [
        //   Center(
        //     child: TextButton(
        //       style: Theme.of(context).textButtonTheme.style!.copyWith(
        //             overlayColor: MaterialStateProperty.all(
        //                 AppColor.tertiaryColor.withOpacity(0.2)),
        //           ),
        //       onPressed: () {},
        //       child: RichText(
        //           text: TextSpan(children: [
        //         TextSpan(
        //           text: 'Already have an account? ',
        //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
        //                 color: AppColor.greyColor,
        //               ),
        //         ),
        //         TextSpan(
        //           text: 'Sign in',
        //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
        //                 color: AppColor.primaryColor,
        //               ),
        //         ),
        //       ])),
        //     ),
        //   ),
        // ],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/hello.png',
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.headline2,
              ),

              Text(
                'To keep connected with us, please login with your personal info',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ).paddingSymmetric(horizontal: 20),
              const YMargin(40),
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
                            'Sign up',
                            textAlign: TextAlign.right,
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          const YMargin(20),
                          Text(
                            'Are you a new user?',
                            textAlign: TextAlign.right,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                          ),
                          const YMargin(20),
                          Text(
                            'If yes, you can sign up and get started with this amazing app.',
                            textAlign: TextAlign.right,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
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
                            builder: (context) => const SignUp(
                              name: 'Sign in',
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
                              'Sign in',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            const YMargin(20),
                            Text(
                              'Are you an existing user?',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                            ),
                            const YMargin(20),
                            Text(
                              'If yes, let\'s sign in so you can continue where you left off.',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
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
              ,
              // const YMargin(20),
              // BorderButton(
              //   text: 'School',
              //   onPressed: () {},
              // ),
              // const YMargin(50),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const BorderButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.tertiaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(text, style: Theme.of(context).textTheme.headline5!),
        ),
      ),
    );
  }
}
