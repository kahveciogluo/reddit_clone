import 'package:flutter/material.dart' hide Color, TextStyle;
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/constants/text_styles.dart';
import 'package:reddit_clone/model/post.dart';
import 'package:reddit_clone/utils/time_util.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon, subreddit name prefixed, time
            Row(
              children: [
                Image.asset('assets/images/reddit_icon.png',
                    width: 20, height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(post.data['subreddit_name_prefixed']),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      '${TimeUtil.intervalTimeAsHour(post.data['created_utc'].toInt())}h',
                      style: AppTextStyles.postItemGreySmall,
                    )),
              ],
            ),
            // title
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                post.data['title'],
                style: AppTextStyles.postItemTitle,
              ),
            ),
            // description
            Visibility(
                visible: _showDescription(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    post.data['selftext'],
                    style: AppTextStyles.postItemGrey,
                  ),
                )),
            // thumbnail
            Visibility(
              visible: _showThumbnail(),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(post.data['thumbnail']),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(width: 1, color: AppColors.lightGrey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
            ),
            // vote, comment, share
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Vote
                  Row(
                    children: [
                      Image.asset('assets/images/post_item/vote_up.png',
                          width: 15, height: 15, color: AppColors.grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          post.data['hide_score']
                              ? 'Vote'
                              : post.data['score'].toString(),
                          style: AppTextStyles.postItemGrey,
                        ),
                      ),
                      Image.asset(
                        'assets/images/post_item/vote_down.png',
                        width: 15,
                        height: 15,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                  // Comment
                  Row(
                    children: [
                      Image.asset('assets/images/post_item/comment.png',
                          width: 15, height: 15, color: AppColors.grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          post.data['num_comments'].toString(),
                          style: AppTextStyles.postItemGrey,
                        ),
                      )
                    ],
                  ),

                  // Share
                  Row(
                    children: [
                      Image.asset('assets/images/post_item/share.png',
                          width: 15, height: 15, color: AppColors.grey),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Share',
                          style: AppTextStyles.postItemGrey,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(width: 50)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _showThumbnail() {
    if (post.data['thumbnail'] == null) return false;
    if (post.data['thumbnail'] == '') return false;
    if (post.data['thumbnail'] == 'self') return false;
    if (post.data['thumbnail'] == 'default') return false;
    return true;
  }

  bool _showDescription() {
    if (post.data['selftext'] == null) return false;
    if (post.data['selftext'] == '') return false;
    return true;
  }
}
