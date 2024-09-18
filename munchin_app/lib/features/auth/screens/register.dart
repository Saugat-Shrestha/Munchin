import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:munchin_app/app/colors/app_color.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/common/widgets/custom_button.dart';
import 'package:munchin_app/features/auth/services/auth_service.dart';
import 'package:munchin_app/providers/check_box_provider.dart';
import 'package:munchin_app/utils/utiils.dart';
import 'package:munchin_app/widgets/app_button.dart';
import 'package:munchin_app/widgets/app_textfield.dart';

import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _signUpFormKey = GlobalKey<FormState>();

  ///
  FocusNode userNameFocuseNode = FocusNode();
  final TextEditingController _userNameController = TextEditingController();
  FocusNode emailfocusNode = FocusNode();
  FocusNode phonefocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode passwordConfirmationFocusNode = FocusNode();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final ValueNotifier<bool> _obsecureText = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obsecureconfirmText = ValueNotifier<bool>(true);

  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _userNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      phone: _phoneController.text,
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _userNameController.text,
      address: _addressController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final checkBoxProvider = Provider.of<CheckBoxProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                // vertical: 20,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Sign Up',
                            style: AppTextStyles.authheader,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            AppTextField(
                              labelText: "Username",
                              textEditingController: _userNameController,
                              focusNode: userNameFocuseNode,
                              hintText: 'Display Name',
                              keyboardType: TextInputType.text,
                              suffixIcon: true,
                              icon: const Icon(CupertinoIcons.person),
                              onValidator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*REQUIRED';
                                }
                                return null;
                              },
                              onFiledSubmittedValue: (newValue) {
                                Utils.fieldFocus(context, userNameFocuseNode,
                                    emailfocusNode);
                              },
                              enable: true,
                              autofocus: true,
                            ),
                            vSizedBox2,
                            AppTextField(
                              labelText: "Email",
                              textEditingController: _emailController,
                              focusNode: emailfocusNode,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
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
                            AppTextField(
                              labelText: "Phone Number",
                              textEditingController: _phoneController,
                              focusNode: phonefocusNode,
                              hintText: 'Phone number',
                              keyboardType: TextInputType.number,
                              suffixIcon: true,
                              icon: const Icon(CupertinoIcons.phone),
                              onValidator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*REQUIRED';
                                }
                                return null;
                              },
                              onFiledSubmittedValue: (newValue) {
                                Utils.fieldFocus(context, userNameFocuseNode,
                                    emailfocusNode);
                              },
                              enable: true,
                              autofocus: true,
                            ),
                            vSizedBox2,
                            AppTextField(
                              labelText: "Address",
                              textEditingController: _addressController,
                              focusNode: addressFocusNode,
                              hintText: 'Select Address',
                              keyboardType: TextInputType.text,
                              suffixIcon: true,
                              icon: const Icon(CupertinoIcons.location),
                              onValidator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*REQUIRED';
                                }
                                return null;
                              },
                              onFiledSubmittedValue: (newValue) {
                                Utils.fieldFocus(context, userNameFocuseNode,
                                    emailfocusNode);
                              },
                              enable: true,
                              autofocus: true,
                              dropdownItems: [
                                "Bagar",
                                "Pardi",
                                "Rambazar",
                                "Mahendrapool",
                                "Gairapatan",
                                "Nalamukh",
                                "Simalchaur",
                                "Batulechaur",
                                "Bindhyabasini",
                                "Bhadrakali",
                                "Fulbari",
                                "Chhorepatan",
                                "Pumdi Bhumdi",
                                "Sarangkot",
                                "Hemja",
                                "Malepatan",
                                "Birauta",
                                "Shitaladevi",
                                "Kaski Kot",
                                "Bhimad",
                                "Khadga Bhanjyang",
                                "Kristi Nachne Chaur",
                                "Kalika",
                                "Majhthana",
                                "Bharat Pokhari",
                                "Arba Bijaypur",
                                "Armala",
                                "Lekhnath",
                                "Begnas",
                                "Sisuwa",
                                "Pumdikot",
                                "Pardi Khola",
                                "Lamachaur"
                              ], // Providing dropdown items
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
                                      return '*REQUIRED';
                                    } else if (_passwordController.text.length <
                                        8) {
                                      return "*Password can not be less than 8 character";
                                    }
                                    return null;
                                  },
                                  onFiledSubmittedValue: (newValue) {
                                    Utils.fieldFocus(context, passwordFocusNode,
                                        passwordConfirmationFocusNode);
                                  },
                                  enable: true,
                                  autofocus: true,
                                );
                              },
                            ),
                            vSizedBox2,
                            ValueListenableBuilder(
                              valueListenable: _obsecureconfirmText,
                              builder: (context, value, child) {
                                return AppTextField(
                                  labelText: "Confirm Password",
                                  textEditingController:
                                      _passwordConfirmationController,
                                  focusNode: passwordConfirmationFocusNode,
                                  hintText: 'Confirm Password',
                                  obsecureText: _obsecureconfirmText.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  suffixIcon: true,
                                  icon: InkWell(
                                    onTap: () {
                                      _obsecureconfirmText.value =
                                          !_obsecureconfirmText.value;
                                    },
                                    child: _obsecureconfirmText.value
                                        ? const Icon(CupertinoIcons.eye_slash)
                                        : const Icon(
                                            CupertinoIcons.eye,
                                            color: GlobalValue.primaryColor,
                                          ),
                                  ),
                                  onValidator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*REQUIRED';
                                    } else if (_passwordConfirmationController
                                            .text !=
                                        _passwordController.text) {
                                      return "*Passwords does not match";
                                    } else if (_passwordController.text.length <
                                        8) {
                                      return "*Password cannot be less than 8 characters";
                                    }
                                    return null;
                                  },
                                  onFiledSubmittedValue: (newValue) {
                                    Utils.fieldFocus(context, passwordFocusNode,
                                        passwordConfirmationFocusNode);
                                  },
                                  enable: true,
                                  autofocus: true,
                                );
                              },
                            ),
                            vSizedBox2,
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: checkBoxProvider.isTicked,
                                  activeColor: Colors.green,
                                  onChanged: (value) {
                                    checkBoxProvider.setTicked(value);
                                  },
                                ),
                                Gap(5),
                                InkWell(
                                  onTap: () {
                                    // TERMS AND CONDITION SCREEN
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const TermsConditionScreen(),
                                    //     ));
                                  },
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'By checking the box you agree',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\nTerms and Conditions',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            vSizedBox2,
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: CustomButton(
                                  color: Color(0xff005288),
                                  text: 'Sign Up',
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    if (_signUpFormKey.currentState!
                                        .validate()) {
                                      if (checkBoxProvider.isTicked == false) {
                                        Utils.showFlusbar(
                                          context,
                                          'Make Sure to Agree Terms and Condtions',
                                          Colors.red.shade300,
                                        );
                                      } else {
                                        signUpUser();
                                      }
                                    }
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
