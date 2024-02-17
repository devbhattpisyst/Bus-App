import 'package:bus/controller/driver_controllers/driver_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverLogin extends GetView<DriverLoginController> {
  const DriverLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Driver Login",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(size.height * .02)),
              padding: EdgeInsets.fromLTRB(size.width * .04, size.height * .03, size.width * .04, size.height * .03),
              // height: size.height * .55,
              width: size.width * .9,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.ce,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        " Email",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: size.height * .02),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .005,
                  ),
                  SizedBox(
                    // height: size.height * .06,
                    // width: size.width * .9,
                    child: TextFormField(
                      controller: controller.emailEditingController,
                      style: TextStyle(
                        // color: CustomTheme.white,
                        fontSize: size.height * .02,
                        fontWeight: FontWeight.w500,
                        letterSpacing: size.height * .001,
                      ),
                      // onChanged: controller.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: size.height * .01, vertical: size.height * .01),
                        hintText: "bus@gmail.com",
                        hintStyle: TextStyle(fontSize: size.height * .02, color: Colors.grey.shade500),
                        // filled: true,

                        // errorText: controller.emailError.value.isEmpty ? null : controller.emailError.value,
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
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1,
                        )),

                        // OutlineInputBorder(

                        // borderSide: BorderSide(
                        //   color: CustomTheme.inputBorder,
                        //   width: size.height * .002,
                        // ),
                        // ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Row(
                    children: [
                      Text(
                        " Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: size.height * .02),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  SizedBox(
                      // height: size.height * .055,
                      // width: size.width * .9,
                      child: ObxValue(
                          (data) => TextFormField(
                                controller: controller.passEditingController,
                                style: TextStyle(
                                  // color: CustomTheme.white,
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: size.height * .001,
                                ),
                                // onChanged: controller.passwordChanged,
                                obscureText: data.value,
                                validator: (value) => value == "" ? "Please Enter Password" : null,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: size.height * .01, vertical: size.height * .01),
                                  hintText: "Bus@123",
                                  hintStyle: TextStyle(fontSize: size.height * .02, color: Colors.grey.shade500),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(size.height * .01)),
                                  filled: true,
                                  // errorText:
                                  // controller.passwordError.value.isEmpty ? null : controller.passwordError.value,
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
                                    color: Theme.of(context).colorScheme.secondary,
                                    width: 1,
                                  )),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.secondary,
                                    width: 1,
                                  )),
                                  suffixIcon: Obx(() => GestureDetector(
                                        onTap: () {
                                          data.value = !data.value;
                                        },
                                        child: Container(
                                            height: size.height * .05,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.3),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(size.height * .005),
                                                  bottomRight: Radius.circular(size.height * .005),
                                                )),
                                            child: Icon(
                                              data.value ? Icons.visibility_off : Icons.visibility,
                                              // color: CustomTheme.white,
                                            )),
                                      )),
                                  fillColor: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                          true.obs)),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * .06,
                        width: size.width * .4,
                        child: ObxValue(
                            (visible) => Visibility(
                                  visible: visible.value,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      visible.value = false;
                                      controller.login();
                                      visible.value = true;
                                    },
                                    style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder()),
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(fontSize: size.height * .02),
                                    ),
                                  ),
                                ),
                            true.obs),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Login as passenger?",
                          style: TextStyle(
                            // color: CustomTheme.white,
                            fontSize: size.height * .018,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .06,
                        width: size.width * .35,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/SignUp");
                          },
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: CustomTheme.bgGrey,
                            elevation: 0,
                          ),
                          child: Text(
                            "Create Account",
                            style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: size.height * .017),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
