part of specification;

abstract class OperatorMixin<T> {
  
  Specification<T> get specification;
  
  CompositeSpecification<T> and(Specification<T> s) =>
      new ConjunctionSpecification(specification, s);
  
  CompositeSpecification<T> or(Specification<T> s) => 
      new DisjunctionSpecification(specification, s);
  
  Specification<T> not() =>
      new NegationSpecification(specification);
  
  CompositeSpecification<T> xor(Specification<T> s) =>
      (this | s) & ~(this & s);
  
  CompositeSpecification<T> operator &(Specification<T> s) =>
      new ConjunctionSpecification(specification, s);
  
  CompositeSpecification<T> operator |(Specification<T> s) =>
      new DisjunctionSpecification(specification, s);
  
  Specification<T> operator ~() =>
      new NegationSpecification(specification);
  
  CompositeSpecification<T> operator ^(Specification<T> s) =>
      (this | s) & ~(this & s);
}