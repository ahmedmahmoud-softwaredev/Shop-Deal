import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'review_model.g.dart';

@HiveType(typeId: 2)
class ReviewModel extends Equatable {
  @HiveField(0)
  final String reviewer;
  @HiveField(1)
  final String reviewerImage;
  @HiveField(2)
  final String review;
  @HiveField(3)
  final int numOfStars;
  @HiveField(4)
  const ReviewModel({
    required this.reviewer,
    required this.reviewerImage,
    required this.review,
    required this.numOfStars,
  });
  factory ReviewModel.fromJSon(Map<String, dynamic> jsonData) {
    return ReviewModel(
      reviewer: jsonData["reviewer"],
      reviewerImage: jsonData["reviewerImage"],
      review: jsonData["review"],
      numOfStars: jsonData["numOfStars"],
    );
  }

  static Map<String, dynamic> toMap(ReviewModel review) => {
        "reviewer": review.reviewer,
        "reviewerImage": review.reviewerImage,
        "review": review.review,
        "numOfStars": review.numOfStars,
      };
  @override
  List<Object?> get props => [reviewer, review, numOfStars, reviewerImage];
}
