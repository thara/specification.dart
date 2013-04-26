part of specification;

abstract class _CompositeSpecification<T> extends Specification<T> {
  
  final List<Specification<T>> _specifications;
  
  _CompositeSpecification(this._specifications);
  
  int get hashCode => _specifications.fold(17, (h, s) => 31 * h + s.hashCode);
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is _CompositeSpecification<T> == false) return false;
    return this._specifications ==
      (other as _CompositeSpecification<T>)._specifications;
  }
}

class _ConjunctionSpecification<T> extends _CompositeSpecification<T> {
  
  _ConjunctionSpecification._(List<Specification<T>> _specs) : super(_specs);
  
  _ConjunctionSpecification(Specification<T> s1, Specification<T> s2)
      : super([s1, s2]);
  
  bool isSatisfiedBy(T candidate) =>
      _specifications.every((s) => s.isSatisfiedBy(candidate));
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is _ConjunctionSpecification<T> == false) return false;
    return this._specifications ==
        (other as _CompositeSpecification<T>)._specifications;
  }
}

class _DisjunctionSpecification<T> extends _CompositeSpecification<T> {
  
  _DisjunctionSpecification._(List<Specification<T>> _specs) : super(_specs);
  
  _DisjunctionSpecification(Specification<T> s1, Specification<T> s2)
      : super([s1, s2]);
  
  bool isSatisfiedBy(T candidate) =>
      _specifications.any((s) => s.isSatisfiedBy(candidate));
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is _ConjunctionSpecification<T> == false) return false;
    return this._specifications ==
        (other as _CompositeSpecification<T>)._specifications;
  }
}