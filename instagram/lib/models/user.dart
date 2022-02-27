class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List following;
  final List followers;

  User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.following,
    required this.followers,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'following': following,
        'followers': followers,
        'bio': bio,
        'photoUrl': photoUrl,
      };
}
