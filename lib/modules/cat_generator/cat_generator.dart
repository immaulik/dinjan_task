import 'package:dinjan_task/modules/cat_generator/cat_generator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CatGenerator extends GetView<CatGeneratorController> {
  const CatGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Cat Generator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(
                    () => controller.isLoading.isTrue
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CachedNetworkImage(
                            imageUrl: controller.imageUrl.value,
                            placeholder: (BuildContext context, String url) =>
                                Center(child: const CircularProgressIndicator()),
                            errorWidget: (BuildContext context, String url,
                                    dynamic error) =>
                                Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 36.sp,
                            ),
                          ),
                  ),
                ),
                Text("Powered by The Cat API"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18.sp),
            child: ElevatedButton(
                onPressed: () => controller.generateCat(),
                child: Text(
                  "Show Another Cat",
                  style: TextStyle(
                    color: Color(0xfff9fafb),
                    fontSize: 20.sp,
                    fontFamily: 'DMSans36pt',
                    fontWeight: FontWeight.w700,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
