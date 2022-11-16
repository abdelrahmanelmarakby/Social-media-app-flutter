import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import 'reaction_button.dart';
import 'share_bottom_sheet.dart';

class PostList extends StatelessWidget {
  const PostList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return PostWidget(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          
         // boxShadow: [
           // BoxShadow(
             // color: Colors.black.withOpacity(0.1),
            //  spreadRadius: 5,
            //  blurRadius: 10,
            //  offset: const Offset(0, 3), // changes position of shadow
            //),
          //],
        ),
        
        
        child: Column(
          children: [
          
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://picsum.photos/${(index * 100) + 500}'),
              ),
              title:  Text('Meta Misr',
              style: getBoldTextStyle(color: ColorsManger.black) ,),
              subtitle:  Text('4 hours ago',
              style: getMediumTextStyle(
                color: ColorsManger.grey,fontSize: 12),),
              trailing: PopupMenuButton(
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
                initialValue: 3,
                itemBuilder:(BuildContext context)=>
                <PopupMenuEntry>[
                  PopupMenuItem(
                      child: Text('Unfollow Meta Misr posts',
                        style: getMediumTextStyle(fontSize: 11,
                            color: ColorsManger.grey),)),
                  PopupMenuItem(
                      child: Text('Report post',
                        style: getMediumTextStyle(fontSize: 11,
                            color: ColorsManger.grey),)),
                  PopupMenuItem(
                      child: Text('Copy link',
                        style: getMediumTextStyle(fontSize: 11,
                            color: ColorsManger.grey),)),

                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam tincidunt, nisl nisl aliquam mauris, nec aliquam nisl nunc sed nisl. Sed euismod, nunc sit amet aliquam tincidunt, nisl nisl aliquam mauris, nec aliquam nisl nunc sed nisl.',
                style: TextStyle(
                  color: ColorsManger.grey,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://picsum.photos/${(index * 100) + 500}",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: context.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReactionButton(),
                  Row(
                    children: const [
                      CircleAvatar(
                          backgroundColor: ColorsManger.light,
                          child: Icon(Iconsax.message)),
                      SizedBox(
                        width: 5,
                      ),
                      Text('1.2k')
                    ],
                  ),
                  InkWell(
                    onTap: () => Get.bottomSheet(
                      const ShareBottomSheet(),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                      ),
                    ),
                    child: Row(
                      children: const [
                        CircleAvatar(
                            backgroundColor: ColorsManger.light,
                            child: Icon(Iconsax.export)),
                        SizedBox(
                          width: 5,
                        ),
                        Text('1.2k')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(
              color: ColorsManger.light,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,)
          ],
        ),
      ).paddingAll(10),
    );
  }
}
