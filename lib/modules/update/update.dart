import 'package:dinjan_task/const/color_const.dart';
import 'package:dinjan_task/utils/app_utils.dart';
import 'package:dinjan_task/utils/validation_utils.dart';
import 'package:dinjan_task/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/modules/update/update_controller.dart';

class Update extends GetView<UpdateController> {
  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: SafeArea(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Update an account',
                    style: TextStyle(
                      color: ColorConst.primary,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    'You can edit Name, Number and profile photo',
                    style: TextStyle(
                        color: Color(0xff343434),
                        fontSize: 16.sp,
                        fontFamily: 'DMSans36pt',
                        letterSpacing: 0),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                      color: Color(0xff523d5f),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  MyTextField(
                    controller: controller.nameCTRL,
                    hint: "Enter name",
                    textInputAction: TextInputAction.next,
                    validatorFunction: ValidationUtils.name,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0xff523d5f),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  MyTextField(
                    controller: controller.emailCTRL,
                    hint: "Enter Email",
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validatorFunction: ValidationUtils.email,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Color(0xff523d5f),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  MyTextField(
                    controller: controller.phoneCTRL,
                    hint: "Enter Phone Number",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    validatorFunction: ValidationUtils.phone,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Color(0xff523d5f),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => controller.pickFile(),
                      child: Container(
                        height: 150.h, // Use ScreenUtil for responsive height
                        width: 1.sw, // Use ScreenUtil for full width
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          // Use ScreenUtil for responsive radius
                          color: ColorConst.primary.withOpacity(0.1),
                        ),
                        child: Obx(() {
                          return controller.profile.value != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.file(
                                    controller.profile.value!,
                                    fit: BoxFit
                                        .contain, // Make sure the image fits the container
                                  ),
                                )
                              : AppUtils.userModel.profile != ""
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        AppUtils.userModel.profile!,
                                        fit: BoxFit
                                            .contain, // Make sure the image fits the container
                                      ),
                                    )
                                  : Center(
                                      child: Icon(
                                        Icons.add,
                                        color: ColorConst.primary,
                                        size: 40
                                            .sp, // Use ScreenUtil for responsive size
                                      ),
                                    );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.onTapUpdate();
                    },
                    child: Container(
                      height: 42.h,
                      width: 1.sw,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorConst.primary,
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Color(0xfff9fafb),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          minimumSize: Size(1.sw, 42.h)),
                      onPressed: () => controller.onTapLogout(),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  SizedBox(
                    height: 30.h,
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
