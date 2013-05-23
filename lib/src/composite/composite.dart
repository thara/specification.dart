part of specification;

// occur Bus Error.
typedef Composite<T> = Object with Conjunctional<T>, Disjunctional<T>, Negational<T>;

// run normally, but test failed...XD
//class Composite<T> {
//  
//  CompositeSpecification<T> operator &(Specification<T> s) =>
//      new ConjunctionSpecification(this, s);
//  
//  CompositeSpecification<T> operator |(Specification<T> s) => 
//      new DisjunctionSpecification(this, s);
//  
//  CompositeSpecification<T> operator ~() => new NegationSpecification(this);
//}

abstract class CompositeSpecification<T> extends Composite<T> {
  
  final List<Specification<T>> _specifications;  
    
  CompositeSpecification(this._specifications);
    
  CompositeSpecification<T> operator ^(Specification<T> s) =>
    (s == null) ? this : (this | s) & ~(this & s);
}

//abstract class CompositeSpecification<T> extends Specification<T> with Conjunctional<T>, Disjunctional<T>, Negational<T> {
//  
//  final List<Specification<T>> _specifications;  
//    
//  CompositeSpecification(this._specifications);
//    
//  CompositeSpecification<T> operator ^(Specification<T> s) =>
//    (s == null) ? this : (this | s) & ~(this & s);
//}