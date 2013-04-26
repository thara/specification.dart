import 'package:unittest/unittest.dart';

import 'package:specification/specification.dart' as spec;

main () {
  
  group("logical conjunction :", () {
    
    var spec1 = spec.expr((value) => value != null);
    var spec2 = spec.expr((String str) => str.startsWith("abc"));
    
    test("A AND B", () {
      var s = spec1 & spec2;
      expect(s.isSatisfiedBy(null), isFalse);
      expect(s.isSatisfiedBy(""), isFalse);
      expect(s.isSatisfiedBy("abcde"), isTrue);
    });
    
    test("A AND B AND C", () {
      var s = spec1 & spec2 & spec.expr((str) => str.length == 6);
      
      expect(s.isSatisfiedBy(null), isFalse);
      expect(s.isSatisfiedBy(""), isFalse);
      expect(s.isSatisfiedBy("abcde"), isFalse);
      expect(s.isSatisfiedBy("abcdef"), isTrue);
    });
  });
  
 group("logical disjuction :", () {
    
    var spec1 = spec.expr((str) => str.length == 4);
    var spec2 = spec.expr((str) => str.startsWith("zx"));
    
    test("A OR B", () {
      var s = spec1 | spec2;
      
      expect(s.isSatisfiedBy(""), isFalse);
      expect(s.isSatisfiedBy("abcde"), isFalse);
      expect(s.isSatisfiedBy("abcd"), isTrue);
      expect(s.isSatisfiedBy("zxyyyyy"), isTrue);
    });
    
    test("A OR B OR C", () {
      var s = spec1 | spec2 | spec.expr((str) => str.contains("foo"));
      
      expect(s.isSatisfiedBy(""), isFalse);
      expect(s.isSatisfiedBy("abcde"), isFalse);
      expect(s.isSatisfiedBy("abcd"), isTrue);
      expect(s.isSatisfiedBy("zxyyyyy"), isTrue);
      expect(s.isSatisfiedBy("xxxfooxxxxxxx"), isTrue);
    });
  });
 
 group("negation :", () {
   
   var spec1 = spec.expr((value) => value == null);
   var spec2 = spec.expr((str) => str.length == 4);
   
   test("NOT A", () {
     var s = ~ spec1;
     
     expect(spec1.isSatisfiedBy(null), isTrue);
     expect(s.isSatisfiedBy(null), isFalse);
   });
   
   test("NOT ( NOT A AND B)", () {
     var s = ~ (~ spec1 & spec2);
     
     expect(s.isSatisfiedBy(null), isTrue);
     expect(s.isSatisfiedBy("abc"), isTrue);
     expect(s.isSatisfiedBy("abcd"), isFalse);
     expect(s.isSatisfiedBy("abcde"), isTrue);
   });
 });
 
 group("exclusive disjunction :", () {
   
   var spec1 = spec.expr((str) => str.length == 3);
   var spec2 = spec.expr((str) => str.startsWith("zy"));
   
   test("A XOR B", () {
     var s = spec1 ^ spec2;
     
     expect(s.isSatisfiedBy("ab"), isFalse);
     expect(s.isSatisfiedBy("abc"), isTrue);
     expect(s.isSatisfiedBy("zyx"), isFalse);
     expect(s.isSatisfiedBy("zyxw"), isTrue);
   });
   
   test("A XOR B XOR C", () {
     var s = spec1 ^ spec2 ^ spec.expr((str) => str.contains("bar"));
     
     expect(s.isSatisfiedBy("ab"), isFalse);
     expect(s.isSatisfiedBy("abc"), isTrue);
     expect(s.isSatisfiedBy("zyx"), isFalse);
     expect(s.isSatisfiedBy("zyxw"), isTrue);
     expect(s.isSatisfiedBy("bar"), isFalse);
     expect(s.isSatisfiedBy("bar2"), isTrue);
     expect(s.isSatisfiedBy("zybar"), isFalse);
   });
 });
}