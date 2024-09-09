import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/models/review_model.dart';
import 'package:shop_deal/features/explore/view_model/write_review_cubit/write_review_cubit.dart';
import 'package:shop_deal/features/explore/views/widgets/review_text_form_field.dart';
import 'package:shop_deal/generated/l10n.dart';

class WriteReviewViewBody extends StatelessWidget {
  WriteReviewViewBody({super.key, required this.product});
  final ProductModel product;
  TextEditingController reviewController = TextEditingController();
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WriteReviewCubit, WriteReviewState>(
      listener: (context, state) {
        if (state is WriteReviewSuccesfulState) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is WriteReviewLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (state is WriteReviewFailureState) {
          return const Center(
            child: Icon(
              Icons.error,
              color: AppColors.primaryColor,
              size: 48.0,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyles26,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    itemSize: MediaQuery.of(context).size.width * 0.16,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: AppColors.starYellowColor,
                    ),
                    onRatingUpdate: (newRating) {
                      rating = newRating;
                    },
                  ),
                  const SizedBox(
                    height: 74.0,
                  ),
                  ReviewTextFormField(
                    controller: reviewController,
                  ),
                  const SizedBox(
                    height: 66.0,
                  ),
                  CustomMaterialButton(
                    title: S.of(context).send,
                    onPressed: () {
                      ReviewModel review = ReviewModel(
                        reviewer: currentUser!.name,
                        reviewerImage: currentUser!.image!,
                        review: reviewController.text,
                        numOfStars: rating.toInt(),
                      );
                      WriteReviewCubit.get(context).sendReview(
                        product: product,
                        review: review,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
