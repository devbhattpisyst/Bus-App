import 'dart:ui';

import 'package:bus/controller/driver_controllers/driver_signup_controller.dart';
import 'package:bus/view/driver/auth/driver_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DriverSignUp extends GetView<DriverSignUpController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      // backgroundColor: CustomTheme.bgColor,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Driver Sign Up",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(size.height * .02),
                  ),
                  padding: EdgeInsets.fromLTRB(size.width * .04,
                      size.height * .01, size.width * .04, size.height * .01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                      Center(
                        child: TextFormField(
                          showCursor: true,
                          // onChanged: controller.firstNameChanged,
                          // cursorColor: CustomTheme.white,
                          // cursorHeight: size.height * .025,

                          // cur
                          controller: DriverSignUpController()
                              .firstnameEditingController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            // color: CustomTheme.white,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w500,
                            letterSpacing: size.height * .002,
                          ),
                          decoration: InputDecoration(
                            hintText: "First Name ",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.height * .01,
                                vertical: size.height * .01),
                            hintStyle: TextStyle(
                                fontSize: size.height * .02,
                                color: Colors.grey.shade500),
                            // fillColor: CustomTheme.bgGrey,
                            border: InputBorder.none,
                            // filled: true,
                            // errorText: controller.firstNameError.isEmpty ? null : controller.firstNameError.value,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: size.height * .002,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: size.height * .002,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                        ),
                      ),
                      Text(
                        "Last Name",
                        style: TextStyle(
                            color: Colors.white, fontSize: size.height * 0.02),
                      ),
                      Center(
                        child: TextFormField(
                          // onChanged: controller.lastNameChanged,
                          keyboardType: TextInputType.text,
                          showCursor: true,
                          // cursorColor: CustomTheme.white,
                          // cursorHeight: size.height * .025,
                          // cur
                          controller: DriverSignUpController()
                              .lastnameEditingController,
                          style: TextStyle(
                            // color: CustomTheme.white,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w500,
                            letterSpacing: size.height * .002,
                          ),
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.height * .01,
                                vertical: size.height * .01),
                            hintStyle: TextStyle(
                                fontSize: size.height * .02,
                                color: Colors.grey.shade500),
                            border: InputBorder.none,
                            // filled: true,
                            // fillColor: CustomTheme.bgGrey,
                            // errorText: controller.lastNameError.isEmpty ? null : controller.lastNameError.value,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: size.height * .002,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: size.height * .002,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                        ),
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.white, fontSize: size.height * 0.02),
                      ),
                      Center(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          showCursor: true,
                          // cursorColor: CustomTheme.white,
                          // cursorHeight: size.height * .025,
                          // onChanged: controller.emailChanged,
                          controller:
                              DriverSignUpController().emailEditingController,
                          style: TextStyle(
                            // color: CustomTheme.white,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w500,
                            letterSpacing: size.height * .002,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.height * .01,
                                vertical: size.height * .01),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontSize: size.height * .02,
                                color: Colors.grey.shade500),
                            // filled: true,
                            // fillColor: CustomTheme.bgGrey,
                            // errorText: controller.emailIdError.isEmpty ? null : controller.emailIdError.value,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: size.height * .002,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: size.height * .002,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                        ),
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.white, fontSize: size.height * 0.02),
                      ),
                      Center(
                        child: ObxValue(
                            (data) => TextFormField(
                                  style: TextStyle(
                                    // color: CustomTheme.white,
                                    fontSize: size.height * 0.02,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: size.height * .002,
                                  ),
                                  showCursor: true,
                                  // cursorColor: CustomTheme.white,
                                  // cursorHeight: size.height * .025,
                                  // onChanged: controller.passwordChanged,
                                  controller: DriverSignUpController()
                                      .passwordEditingController,
                                  obscureText: data.value,
                                  validator: (value) => value == ""
                                      ? "Please Enter Password"
                                      : null,
                                  decoration: InputDecoration(
                                    // hintText: "fanbuku@gmail.com",
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: size.height * 0.01,
                                        vertical: size.height * 0.01),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontSize: size.height * .02,
                                        color: Colors.grey.shade500),

                                    border: InputBorder.none,
                                    // filled: true,
                                    // fillColor: CustomTheme.bgGrey,
                                    // errorText:
                                    //     controller.passwordError.value.isEmpty ? null : controller.passwordError.value,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                        width: size.height * .002,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                        width: size.height * .002,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                    suffixIcon: Obx(() => GestureDetector(
                                          onTap: () {
                                            data.value = !data.value;
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primaryContainer
                                                      .withOpacity(.3),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        size.height * 0.01),
                                                    bottomRight:
                                                        Radius.circular(
                                                            size.height * 0.01),
                                                  )),
                                              child: Icon(
                                                data.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                // color: CustomTheme.white,
                                                size: size.height * .03,
                                              )),
                                        )),
                                  ),
                                ),
                            true.obs),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   height: size.height * .055,
                              //   width: size.width * .4,
                              //   child: ElevatedButton(

                              //     onPressed: () {},
                              //     child: Text("NEXT"),
                              //   ),
                              // ),
                              GestureDetector(
                                child: Container(
                                  height: size.height * .06,
                                  width: size.width * .45,
                                  decoration: BoxDecoration(
                                      // color: CustomTheme.orange,
                                      borderRadius: BorderRadius.circular(
                                          size.height * 0.01)),
                                  child: ObxValue(
                                      (visible) => Visibility(
                                            visible: visible.value,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primaryContainer,
                                                  shape:
                                                      BeveledRectangleBorder(),
                                                  elevation: 0),
                                              onPressed: () {
                                                FocusManager
                                                    .instance.primaryFocus!
                                                    .unfocus();
                                                visible.value = false;
                                                DriverSignUpController()
                                                    .SignUp();
                                                ;
                                                Get.back();
                                                visible.value = true;
                                                // Get.toNamed(
                                                //     "/mobileVerification");
                                              },
                                              child: Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                    // color: CustomTheme.white,
                                                    fontSize:
                                                        size.height * 0.025),
                                              ),
                                            ),
                                          ),
                                      true.obs),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
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
