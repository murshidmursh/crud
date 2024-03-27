import '../main.dart';

class Usermodel{
  String? name;
  String? email;
  String? password;
  String? confirmpassword;
  String? id;

  Usermodel({
    this.name,
    this.email,
    this.password,
    this.confirmpassword,
    this.id,

  });
  Map<String,dynamic> toMap(){
    return{
      "name":this.name,
      "email":this.email,
      "password":this.password,
      "confirmpassword":this.confirmpassword,
      "id":this.id,
    };
  }
  factory Usermodel.fromMap(Map<String,dynamic>map){
    return Usermodel(
      name: map["name"]??"",
      email: map["email"]??"",
      password: map["password"]??"",
      confirmpassword: map["confirmpassword"]??"",
      id: map["id"]??"",
    );
  }
  Usermodel copywith({
    String? name,
    String? email,
    String? password,
    String? confirmpassword,
    String? id,
}){
    return Usermodel(
      name: name??this.name,
      email: email??this.email,
      password: password??this.password,
      confirmpassword: confirmpassword??this.confirmpassword,
      id: id??this.id,
    );
  }
}