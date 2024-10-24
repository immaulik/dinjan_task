import 'package:flutter/material.dart';
import 'package:dinjan_task/const/color_const.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child:  CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(ColorConst.primary),
        ),
      ),
    );
  }
}
