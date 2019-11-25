
import 'dart:convert';

class User {

   String uid;
   String email;
   String photoUrl;
   String displayName;
   String followers;
   String following;
   String posts;
   String bio;
   String phone;
   List<User> friends;

   User({this.uid, this.email, this.photoUrl, this.displayName, this.followers, this.following, this.bio, this.posts, this.phone,this.friends});

    Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['email'] = user.email;
    data['photoUrl'] = user.photoUrl;
    data['displayName'] = user.displayName;
    data['followers'] = user.followers;
    data['following'] = user.following;
    data['bio'] = user.bio;
    data['posts'] = user.posts;
    data['phone'] = user.phone;
    data['friends'] = user.friends;
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.email = mapData['email'];
    this.photoUrl = mapData['photoUrl'];
    this.displayName = mapData['displayName'];
    this.followers = mapData['followers'];
    this.following = mapData['following'];
    this.bio = mapData['bio'];
    this.posts = mapData['posts'];
    this.phone = mapData['phone']; 
    this.friends = mapData['friends'];
  }
}

