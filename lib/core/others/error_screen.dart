import 'package:flutter/material.dart';

import '../../../core/resourses/color_manger.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: ColorsManger.lightGrey,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Something is not right here...",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
