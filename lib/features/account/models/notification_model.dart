import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'notification_model.g.dart';

@HiveType(typeId: 8)
class NotificationModel extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String? image;

  const NotificationModel(
      {required this.title, required this.content, this.image});

  @override
  List<Object?> get props => [title, content, image];
}
