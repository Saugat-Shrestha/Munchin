import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:munchin_app/app/colors/app_color.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/features/auth/screens/register.dart';
import 'package:munchin_app/features/auth/services/auth_service.dart';

import 'package:munchin_app/providers/check_box_provider.dart';
import 'package:munchin_app/utils/utiils.dart';
import 'package:munchin_app/widgets/app_button.dart';
import 'package:munchin_app/widgets/app_textfield.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  AuthScreen({
    super.key,
    this.screen,
    this.textFrom,
  });
  Widget? screen;
  String? textFrom;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService authService = AuthService();
  FocusNode emailfocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obsecureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final checkBoxProvider = Provider.of<CheckBoxProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.06,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Welcome to Munchin',
                            style: AppTextStyles.authheader,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            AppTextField(
                              labelText: "Email",
                              textEditingController: _emailController,
                              focusNode: emailfocusNode,
                              hintText: 'info@domain.com',
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: false,
                              suffixIcon: true,
                              icon: const Icon(Icons.mail_outline_outlined),
                              onValidator: (value) {
                                return Utils.validateEmail(value);
                              },
                              onFiledSubmittedValue: (newValue) {
                                Utils.fieldFocus(
                                    context, emailfocusNode, passwordFocusNode);
                              },
                              enable: true,
                              autofocus: true,
                            ),
                            vSizedBox2,
                            ValueListenableBuilder(
                              valueListenable: _obsecureText,
                              builder: (context, value, child) {
                                return AppTextField(
                                  labelText: "Password",
                                  textEditingController: _passwordController,
                                  focusNode: passwordFocusNode,
                                  hintText: 'Password',
                                  obsecureText: _obsecureText.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  suffixIcon: true,
                                  icon: InkWell(
                                    onTap: () {
                                      _obsecureText.value =
                                          !_obsecureText.value;
                                    },
                                    child: _obsecureText.value
                                        ? const Icon(CupertinoIcons.eye_slash)
                                        : const Icon(
                                            CupertinoIcons.eye,
                                            color: GlobalValue.primaryColor,
                                          ),
                                  ),
                                  onValidator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password can't be empty";
                                    }
                                    // else if (_passwordController.text.length <
                                    //     8) {
                                    //   return "Password can't be less than 8 character";
                                    // }
                                    return null;
                                  },
                                  onFiledSubmittedValue: (newValue) {
                                    // Utils.fieldFocus(context, passwordFocusNode,
                                    //     passwordConfirmationFocusNode);
                                  },
                                  enable: true,
                                  autofocus: true,
                                );
                              },
                            ),
                            vSizedBox0,
                            SizedBox(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: checkBoxProvider.isTicked,
                                      activeColor: Colors.green,
                                      onChanged: (value) {
                                        checkBoxProvider.setTicked(value);
                                      },
                                    ),
                                    const Text(
                                      'Remember Me',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      // style: AppTextStyles.appTextBodySmall,
                                    ),
                                  ],
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     // Navigator.pushNamed(
                                //     //     context, RouteName.forgotPassword);
                                //   },
                                //   child: const Text(
                                //     'Forgot Password ?',
                                //     style: AppTextStyles.authheader,
                                //   ),
                                // ),
                              ],
                            )),
                            vSizedBox2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: AppButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (_signInFormKey.currentState!.validate()) {
                                    signInUser();
                                  }
                                },
                                buttonColor: GlobalValue.primaryColor,
                                buttonText: 'Login',
                                buttonTxtColor: Colors.white,
                              ),
                            ),
                            vSizedBox2,
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Divider(
                                      height: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      'or',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: GlobalValue.primaryColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Divider(
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            vSizedBox2,
                            const Text(
                              "Don't have an account yet?",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            vSizedBox0,
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: AppButton(
                                buttonColor: GlobalValue.primaryColor,
                                buttonTxtColor: Colors.white,
                                // isLoading: provider.isloading,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RegisterScreen.routeName);
                                },
                                buttonText: 'Register Now',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
