import 'package:townsquare/domain/entity/activity_entity.dart';

class ActivityModel extends ActivityEntity {
  ActivityModel({
    required super.id,
    required super.time,
    required super.duration,
    required super.title,
    required super.location,
    required super.availableSpots,
    required super.price,
    required super.category,
    required super.tags,
    required super.joined,
  });

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'],
      time: map['time'],
      duration: map['duration'],
      title: map['title'],
      location: map['location'],
      availableSpots: map['availableSpots'],
      price: map['price'].toDouble(),
      category: map['category'],
      tags: List<String>.from(
        map["tags"].map((x) => x),
      ),
      joined: map['joined'],
    );
  }
}
