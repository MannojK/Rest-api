void main(){
  var obj = Student();
  obj.display();
  obj.name;
  obj.age;
}
 class Student{
    var name = 'rahul';
     var age = '20'; // variables declare under the class is known as instance variables
 void display(){
  // Methods  declare under the class is known as instance Methods 
  print('Name = $name');
  print('age = $age');
 }
 }