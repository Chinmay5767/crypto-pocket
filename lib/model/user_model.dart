//it stores informtion about user
class UserModel {
  String uid;
  String ?displayName;
  String ?avatarUrl;

  UserModel(this.uid, {this.displayName, this.avatarUrl});
}
