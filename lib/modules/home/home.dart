import 'package:dinjan_task/const/color_const.dart';
import 'package:dinjan_task/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/modules/home/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                child: const Text('Edit Profile'),
                onTap: () => controller.onTapEdit(),
              ),
              new PopupMenuItem<String>(
                child: const Text('Cat Generator'),
                onTap: () => controller.onTapCatGenerate(),
              ),
            ],
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.userList.isNotEmpty
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.userList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(18.sp),
                    itemBuilder: (context, index) {
                      return UserTile(
                        model: controller.userList[index],
                      );
                    },
                  )
                : Center(
                    child: Text("There is no users to show"),
                  ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  UserTile({required this.model, super.key});

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15.h),
        width: 1.sw,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.sp),
          boxShadow: [
            BoxShadow(
              color: Color(0x17273a73),
              offset: Offset(0, 1.h),
              blurRadius: 6.sp,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: model.profile != ""
                      ? Image.network(model.profile)
                      : Icon(
                          Icons.person,
                          size: 40.sp,
                          color: ColorConst.primary.withOpacity(0.2),
                        ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                        color: ColorConst.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(model.email),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(model.phone),
          ],
        ));
  }
}
