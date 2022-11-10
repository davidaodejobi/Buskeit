// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/constant/helper/helper.dart';
import 'package:buskeit/modules/dashboard_flow/screens/flow_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/app_color.dart';
import '../../shared/shared.dart';
import '../auth_flow/screens/sign_up.dart';
import 'view_model/welcome_provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final siCont = Provider.of<SigninProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const YMargin(10),
            Column(
              children: [
                Image.asset(
                  'assets/images/hello.png',
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const YMargin(16),
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'To keep connected with us, please login with your personal info',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const YMargin(40),
                TextFieldWithHeader(
                  controller: siCont.emailController,
                  title: 'Email',
                  hintText: 'You@gmail.com',
                ),
                const YMargin(20),
                TextFieldWithHeader(
                  controller: siCont.emailController,
                  title: 'Password',
                  hintText: '********',
                ),
                const YMargin(16),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FlowSelection(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                  ),
                        ))),
              ],
            ),
            TextButton(
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                    overlayColor: MaterialStateProperty.all(
                        AppColor.tertiaryColor.withOpacity(0.2)),
                  ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(
                      name: 'Sign Up',
                    ),
                  ),
                );
              },
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColor.greyColor,
                      ),
                ),
                TextSpan(
                  text: 'Sign up',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColor.primaryColor,
                      ),
                ),
              ])),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
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

              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         padding: const EdgeInsets.fromLTRB(8, 25, 20, 20),
              //         height: MediaQuery.of(context).size.height * 0.55,
              //         decoration: BoxDecoration(
              //           color: AppColor.primaryColor,
              //           borderRadius: const BorderRadius.only(
              //             bottomRight: Radius.circular(20),
              //             topRight: Radius.circular(20),
              //           ),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.black.withOpacity(0.2),
              //               blurRadius: 10,
              //               offset: const Offset(0, 5),
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.end,
              //           children: [
              //             Text(
              //               'Sign up',
              //               textAlign: TextAlign.right,
              //               style:
              //                   Theme.of(context).textTheme.headline3!.copyWith(
              //                         color: Colors.white,
              //                       ),
              //             ),
              //             const YMargin(20),
              //             Text(
              //               'Are you a new user?',
              //               textAlign: TextAlign.right,
              //               style:
              //                   Theme.of(context).textTheme.headline5!.copyWith(
              //                         color: Colors.white,
              //                         fontSize: 20,
              //                       ),
              //             ),
              //             const YMargin(20),
              //             Text(
              //               'If yes, you can sign up and get started with this amazing app.',
              //               textAlign: TextAlign.right,
              //               style:
              //                   Theme.of(context).textTheme.headline5!.copyWith(
              //                         color: Colors.white,
              //                       ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     const XMargin(20),
              //     Expanded(
              //       child: GestureDetector(
              //         onTap: (() {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => const SignUp(
              //                 name: 'Sign in',
              //               ),
              //             ),
              //           );
              //         }),
              //         child: Container(
              //           padding: const EdgeInsets.fromLTRB(20, 25, 8, 20),
              //           height: MediaQuery.of(context).size.height * 0.4,
              //           decoration: BoxDecoration(
              //             color: AppColor.secondaryColor,
              //             borderRadius: const BorderRadius.only(
              //               bottomLeft: Radius.circular(20),
              //               topLeft: Radius.circular(20),
              //             ),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.black.withOpacity(0.4),
              //                 blurRadius: 10,
              //                 offset: const Offset(0, 5),
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Sign in',
              //                 textAlign: TextAlign.left,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .headline3!
              //                     .copyWith(
              //                       color: Colors.white,
              //                     ),
              //               ),
              //               const YMargin(20),
              //               Text(
              //                 'Are you an existing user?',
              //                 textAlign: TextAlign.left,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .headline5!
              //                     .copyWith(
              //                       color: Colors.white,
              //                       fontSize: 20,
              //                     ),
              //               ),
              //               const YMargin(20),
              //               Text(
              //                 'If yes, let\'s sign in so you can continue where you left off.',
              //                 textAlign: TextAlign.left,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .headline5!
              //                     .copyWith(
              //                       color: Colors.white,
              //                     ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
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