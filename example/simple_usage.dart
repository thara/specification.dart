import 'package:specification/specification.dart' as spec;

main () {
  var spec1 = spec.expr((value) => value.length > 2);
  var spec2 = spec.expr((String str) => str.startsWith("abc"));
  
  var conjunction = spec1 & spec2;
  print(conjunction.isSatisfiedBy("a"));      // false
  print(conjunction.isSatisfiedBy("abb"));    // false
  print(conjunction.isSatisfiedBy("abcde"));  // true
  
  var disjuction = spec1 | spec2;
  print(disjuction.isSatisfiedBy("a"));       // false
  print(disjuction.isSatisfiedBy("abb"));     // true
  print(disjuction.isSatisfiedBy("abcde"));   // true
  
  var negation = ~spec1;
  print(negation.isSatisfiedBy("a"));         // true
  print(negation.isSatisfiedBy("abb"));       // false
  print(negation.isSatisfiedBy("abcde"));     // false
  
  var exclusiveDisjunction = spec1 ^ spec2;
  print(exclusiveDisjunction.isSatisfiedBy("a"));     // false
  print(exclusiveDisjunction.isSatisfiedBy("abb"));   // true
  print(exclusiveDisjunction.isSatisfiedBy("abcde")); // false
}