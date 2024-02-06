import 'dart:io';
void main(){
  
  var num = ['100', '200', '300'];
  num.forEach((x)=> print(x));
  print("enter your first name");
  String? firstName = stdin.readLineSync();
  
    print("enter your first name");
  String? secondName = stdin.readLineSync();

print('Full name : $firstName $secondName');

}
