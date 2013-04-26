part of specification;

abstract class Specification<T> {
  
  bool isSatisfiedBy(T candidate);
  
  Specification<T> operator &(Specification<T> s) =>
      new _ConjunctionSpecification(this, s);
  
  Specification<T> operator |(Specification<T> s) => 
      new _DisjunctionSpecification(this, s);
  
  Specification<T> operator ^(Specification<T> s) =>
      (s == null) ? this : (this | s) & ~(this & s);
  
  Specification<T> operator ~() => new _NegationSpecification(this);
}

class _NegationSpecification<T> extends Specification<T> {
  
  final Specification<T> _s;

  _NegationSpecification(this._s);

  bool isSatisfiedBy(T candidate) => _s.isSatisfiedBy(candidate) == false;
  
  int get hashCode => _s.hashCode * 17;
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is _NegationSpecification<T> == false) return false;
    return this._s == (other as _NegationSpecification<T>)._s;
  }
}