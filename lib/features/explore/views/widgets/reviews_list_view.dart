import 'package:flutter/material.dart';
import 'package:online_shop/features/explore/models/review_model.dart';
import 'package:online_shop/features/explore/views/widgets/review_widget.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.reviews});
  final List<ReviewModel> reviews;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ReviewWidget(
        review: reviews[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 30.0,
      ),
      itemCount: reviews.length,
    );
  }
}
