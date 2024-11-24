// ignore_for_file: public_member_api_docs, sort_constructors_first
class ActivityEntity {
  final int id;
  final String time;
  final String duration;
  final String title;
  final String location;
  int availableSpots;
  final double price;
  final String category;
  final List<String> tags;
  bool joined;
  ActivityEntity({
    required this.id,
    required this.time,
    required this.duration,
    required this.title,
    required this.location,
    required this.availableSpots,
    required this.price,
    required this.category,
    required this.tags,
    required this.joined,
  });
}
