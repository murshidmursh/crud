// class Usermodel{
//   String? emailaddress;
//   String? password;
//   String? pincode;
//   String? address;
//   String? city;
//   String? state;
//   String? country;
//   String? bankaccountnumber;
//   String? accountholdersname;
//   String? ifsccode;
//   Usermodel({
//     this.emailaddress,
//     this.password,
//     this.pincode,
//     this.address,
//     this.city,
//     this.state,
//     this.country,
//     this.bankaccountnumber,
//     this.accountholdersname,
//     this.ifsccode,
//   });
//
//   get id => null;
//   Map<String,dynamic>toMap(){
//     return{
//       "email":this.emailaddress,
//       "password":this.password,
//       "pincode":this.pincode,
//       "address":this.address,
//       "city":this.city,
//       "state":this.state,
//       "country":this.country,
//       "bankaccountnumber":this.bankaccountnumber,
//       "accountholdersname":this.accountholdersname,
//       "ifsccode":this.ifsccode,
//     };
//   }
//   factory Usermodel.fromMap(Map<String,dynamic>Map){
//     return Usermodel(
//       emailaddress: Map["name"]??"",
//       password: Map["name"]??"",
//       pincode: Map["name"]??"",
//       address: Map["name"]??"",
//       city: Map["name"]??"",
//       state: Map["name"]??"",
//       country: Map["name"]??"",
//       bankaccountnumber: Map["name"]??"",
//       accountholdersname: Map["name"]??"",
//       ifsccode: Map["name"]??"",
//     );
//   }
//   Usermodel copywith({
//     String? emailaddress,
//     String? password,
//     String? pincode,
//     String? address,
//     String? city,
//     String? state,
//     String? country,
//     String? bankaccountnumber,
//     String? accountholdersname,
//     String? ifsccode,
//   }) {
//     return Usermodel(
//       emailaddress: emailaddress ?? this.emailaddress,
//
//     );
//   }
// }