// user cotroller is a layer between firebase repository and ui
//  a user controller is a server-side component that allows developers to manage user authentication,
// including creating, updating, and deleting user accounts. The user controller interacts with Firebase's 
//authentication service to handle user authentication and provide various functionalities related to user management,
// such as sending password reset emails, verifying email addresses, and managing user profiles.
class UserModel {
  late UserModel _currentUser;
  UserModel get currentUser => _currentUser;
}
