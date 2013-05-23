part of specification;

abstract class Disjunctional<T> implements Specification<T> {
  
  CompositeSpecification<T> operator |(Specification<T> s) => 
      new DisjunctionSpecification(this, s);
  
  CompositeSpecification<T> or(Specification<T> s) => 
      new DisjunctionSpecification(this, s);
}

class DisjunctionSpecification<T> extends CompositeSpecification<T> {
  
  DisjunctionSpecification._(List<Specification<T>> _specs) : super(_specs);
  
  DisjunctionSpecification(Specification<T> s1, Specification<T> s2)
      : super([s1, s2]);
  
  bool isSatisfiedBy(T candidate) =>
      _specifications.any((s) => s.isSatisfiedBy(candidate));
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is DisjunctionSpecification<T> == false) return false;
    return this._specifications ==
        (other as DisjunctionSpecification<T>)._specifications;
  }
}