library equivalent_test;

import 'package:test/test.dart';

import 'package:specification/specification.dart' as spec;

main () => run();

run () {
  test("PredicateSpecification's equivalent", () {
    
    var expression = (value) => value != null;
    var spec1 = spec.expr(expression);
    var spec2 = spec.expr(expression);
    
    expect(identical(spec1, spec2), isFalse);
    expect(spec1 == spec2, isTrue);
    expect(spec1.hashCode == spec2.hashCode, isTrue);
  });   
}