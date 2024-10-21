class User {
  final int id;
  final String name;
  final String email;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
  });
}

class Room {
  final String name;
  final double height;
  final double width;
  final double length;

  Room({
    required this.name,
    required this.height,
    required this.width,
    required this.length,
  });
}
