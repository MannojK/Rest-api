void main() {
  var obj = A();
var obj2 = A();
var obj3= A();
print(obj.x);
print(obj.x = 23);
print(A.y);
}


class A {
  int x = 10;
  static int y = 20;

}
