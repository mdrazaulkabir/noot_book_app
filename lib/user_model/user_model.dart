class UserModel {
  late String id;
  late String email;
  late String firstName;
  late String lastName;
  late String mobile;
  UserModel.fromJson(Map<String,dynamic>json){
    id = json['_id'];
    email=json['email'];
    firstName=json['firstName'];
    lastName=json['lastName'];
    mobile=json['mobile'];
  }
  Map<String ,dynamic>toJson(){
    return {
      '_id': id,
      'email': email,
      'firstName':firstName,
      'lastName':lastName,
      'mobile':mobile
    };
  }
}