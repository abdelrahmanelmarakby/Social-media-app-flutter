import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/resourses/color_manger.dart';
import 'reaction_button.dart';

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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://picsum.photos/${(index * 100) + 500}'),
              ),
              title: const Text('Meta Misr'),
              subtitle: const Text('4 hours ago'),
              trailing: const Icon(Icons.more_vert),
              
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
                          backgroundColor: ColorsManger.grey1,
                          child: Icon(Iconsax.message)),
                      SizedBox(
                        width: 5,
                      ),
                      Text('1.2k')
                    ],
                  ),
                  Row(
                    children: const [
                      CircleAvatar(
                          backgroundColor: ColorsManger.grey1,
                          child: Icon(Iconsax.share)),
                      SizedBox(
                        width: 5,
                      ),
                      Text('1.2k')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ).paddingAll(10),
    );
  }
}
