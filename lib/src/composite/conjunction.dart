part of specification;

abstract class Conjunctional<T> implements Specification<T> {
  
  CompositeSpecification<T> operator &(Specification<T> s) =>
      new ConjunctionSpecification(this, s);
  
  CompositeSpecification<T> and(Specification<T> s) =>
      new ConjunctionSpecification(this, s);
}

class ConjunctionSpecification<T> extends CompositeSpecification<T> {
  
  ConjunctionSpecification._(List<Specification<T>> _specs) : super(_specs);
  
  ConjunctionSpecification(Specification<T> s1, Specification<T> s2)
      : super([s1, s2]);
  
  bool isSatisfiedBy(T candidate) =>
      _specifications.every((s) => s.isSatisfiedBy(candidate));
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is ConjunctionSpecification<T> == false) return false;
    return this._specifications ==
        (other as ConjunctionSpecification<T>)._specifications;
  }
}