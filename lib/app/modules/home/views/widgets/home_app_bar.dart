import 'package:flutter/material.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
