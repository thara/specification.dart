part of specification;

abstract class Negational<T> implements Specification<T> {
  
  CompositeSpecification<T> operator ~() => new NegationSpecification(this);
  
  CompositeSpecification<T> not() => new NegationSpecification(this);
}

class NegationSpecification<T> extends Specification with Composite<T> {
  
  final Specification<T> _s;

  NegationSpecification(this._s);

  bool isSatisfiedBy(T candidate) => _s.isSatisfiedBy(candidate) == false;
  
  int get hashCode => _s.hashCode * 17;
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is NegationSpecification<T> == false) return false;
    return this._s == (other as NegationSpecification<T>)._s;
  }
}

