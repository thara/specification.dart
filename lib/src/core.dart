part of specification;

abstract class Specification<T> {
  
  bool isSatisfiedBy(T candidate);
  
//  Specification<T> operator &(Specification<T> s) =>
//      new _ConjunctionSpecification(this, s);
//  
//  Specification<T> operator |(Specification<T> s) => 
//      new _DisjunctionSpecification(this, s);
//  
//  Specification<T> operator ^(Specification<T> s) =>
//      (s == null) ? this : (this | s) & ~(this & s);
//  
//  Specification<T> operator ~() => new _NegationSpecification(this);
}