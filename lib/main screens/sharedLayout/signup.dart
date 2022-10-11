import 'package:animalcare/common/widgets/customedcontainer.dart';
import 'package:animalcare/common/widgets/pic.dart';
import 'package:animalcare/common/widgets/textfield.dart';
import 'package:animalcare/common/widgets/custombutton.dart';
import 'package:animalcare/main%20screens/doctor%20module/completedata.dart';
import 'package:animalcare/resources/authentication_methods.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/util.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String dropdownvalue = 'User';
  var items = ['User', 'Doctor'];
  @override
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool passwordVisible = false;
  bool Issecure = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              PictureBack(),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.13),
                child: CustomedContainer(
                    190,
                    0,
                    0.79,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Color.fromRGBO(50, 132, 132, 1),
                                      fontSize: 37,
                                      fontFamily: "title"),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Create yor own account now",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.47),
                                    fontSize: 13,
                                    fontFamily: "alef",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.035,
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: FormFields("Name", Icon(Icons.person),
                                  null, false, nameFieldController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.03,
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: FormFields(
                                  "Email",
                                  const Icon(Icons.email),
                                  null,
                                  false,
                                  emailFieldController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.03,
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: FormFields(
                                  "Phone",
                                  Icon(Icons.phone_android_rounded),
                                  null,
                                  false,
                                  phoneFieldController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.03,
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: FormFields(
                                  "Password",
                                  Icon(Icons.lock),
                                  IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Issecure = !Issecure;
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  Issecure,
                                  passwordFieldController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.2),
                                    child: const Text(
                                      "Signup As:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: "alef",
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.17),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        items: items
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: dropdownvalue,
                                        onChanged: (value) {
                                          setState(() {
                                            dropdownvalue = value as String;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_drop_down_circle,
                                          size: 20,
                                        ),
                                        iconSize: 16,
                                        iconEnabledColor: Colors.black,
                                        buttonHeight: 50,
                                        buttonWidth: 160,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                          ),
                                          color: Colors.grey.shade300,
                                        ),
                                        buttonElevation: 2,
                                        itemHeight: 40,
                                        itemPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        dropdownMaxHeight: 200,
                                        dropdownWidth: 200,
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: Colors.grey.shade300,
                                        ),
                                        dropdownElevation: 8,
                                        scrollbarRadius:
                                            const Radius.circular(40),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.1,
                                  left:
                                      MediaQuery.of(context).size.width * 0.15,
                                  right:
                                      MediaQuery.of(context).size.width * 0.15,
                                  bottom: MediaQuery.of(context).size.width *
                                      0.001),
                              child: CustomButton(
                                  "SIGN UP",
                                  const Color.fromRGBO(50, 132, 132, 1),
                                  Colors.white, () async {
                                if (formKey.currentState != null &&
                                    formKey.currentState!.validate()) {
                                  String output =
                                      await authenticationMethods.signUpUser(
                                          name: nameFieldController.text,
                                          phone: phoneFieldController.text,
                                          email: emailFieldController.text,
                                          password: passwordFieldController.text,
                                          type: dropdownvalue);
                                  if (output == "success" && dropdownvalue =="User") {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                            builder: (_) => LogIn()));
                                  } else if(output == "success" && dropdownvalue =="Doctor"){
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                            builder: (_) => CompleteData()));
                                  }
                                  else {
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                } else{

                                  Utils().showSnackBar(
                                      context: context, content: "Please Enter your data.");
                                }

                              }, 42, 0.75, 19),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
