#Specification.dart

##[Dart](http://www.dartlang.org/) implementation of the Specification pattern in Domain Driven Design.

[![Build Status](https://drone.io/github.com/tomochikahara/specification.dart/status.png)](https://drone.io/github.com/tomochikahara/specification.dart/latest)

### What is the specificaiton pattern?

> the specification pattern is a particular software design pattern, whereby business rules can be recombined by chaining the business rules together using boolean logic. 
> 
> ["Specification pattern."](http://en.wikipedia.org/wiki/Specification_pattern) Wikipedia: The Free Encyclopedia. Wikimedia Foundation, Inc. 15 April 2013. Web. 27 April 2013.

### Examples

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
      print(negation.isSatisfiedBy("abcde""));     // false
      
      var exclusiveDisjunction = spec1 ^ spec2;
      print(exclusiveDisjunction.isSatisfiedBy("a"));     // false
      print(exclusiveDisjunction.isSatisfiedBy("abb"));   // true
      print(exclusiveDisjunction.isSatisfiedBy("abcde")); // false
    }

### Licence

see LICENSE

### Author
* Tomochika Hara([+tomochikahara](https://plus.google.com/118297765674260615355), [@tomochikahara](https://twitter.com/tomochikahara), [@zetta1985](https://twitter.com/zetta1985)) 