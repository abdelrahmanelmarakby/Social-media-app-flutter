import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../routes/app_pages.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.SEARCH),
          child: const Icon(
            CupertinoIcons.search,
            color: ColorsManger.primary,
            size: 30,
          ).paddingSymmetric(horizontal: 12),
        ),
      ],
      title: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text('Future ',
                style: getMediumTextStyle(
                    fontSize: 20, color: ColorsManger.primary)),
            Text('Chat',
                style: getMediumTextStyle(
                    fontSize: 20, color: ColorsManger.black)),
          ],
        ),
      ),
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
