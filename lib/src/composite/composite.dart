part of specification;

typedef Composite<T> = Object with Conjunctional<T>, Disjunctional<T>, Negational<T>;

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