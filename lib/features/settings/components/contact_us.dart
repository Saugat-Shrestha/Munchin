import 'package:flutter/material.dart';
import 'package:munchin_app/app/colors/app_color.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/features/settings/components/contact_model.dart';
import 'package:munchin_app/features/settings/components/custom_buttons.dart';
import 'package:munchin_app/features/settings/components/postdata.dart';
import 'package:provider/provider.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _fromEmailController = TextEditingController();
  final TextEditingController _fromNameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _mailMessageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<PostDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF1F2F9),
        title: Text("Contact Us"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // pro.cancelPostEmail();
        },
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                color: const Color(0xffF1F2F9),
              ),
              // SizedBox(
              //   child: Image.asset(bg),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vSizedBox1,
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 2,
                                offset: const Offset(0, 1), // Shadow position
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _fromEmailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              // labelText: 'Message',
                              hintText: 'From email',

                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 2,
                                offset: const Offset(0, 1), // Shadow position
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _fromNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              // labelText: 'Message',
                              hintText: 'Name',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 2,
                                offset: const Offset(0, 1), // Shadow position
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _subjectController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter subject';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              // labelText: 'Message',
                              hintText: 'Subject',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 2,
                                offset: const Offset(0, 1), // Shadow position
                              ),
                            ],
                          ),
                          child: TextFormField(
                            maxLines: 5,
                            controller: _mailMessageController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the message';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Write your message',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomAppButtonInfos(
                          isloading: pro.loading,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              final data = FeedbackDataModel(
                                  name: _fromNameController.text.toString(),
                                  email: _fromEmailController.text.toString(),
                                  subject: _subjectController.text.toString(),
                                  message:
                                      _mailMessageController.text.toString());

                              pro
                                  .postData(
                                data,
                              )
                                  .then((value) {
                                _fromNameController.clear();
                                _fromEmailController.clear();
                                _mailMessageController.clear();
                                _subjectController.clear();
                              });
                            }
                          },
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.07,
                          buttonTxtColor: Colors.white,
                          buttonText: '   Send Now',
                          buttonColor: GlobalValue.primaryColor,
                          fontsize: 15,
                          isIconShowable: true,
                          buttoniconpath: 'assets/svg/send_icon.svg',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
