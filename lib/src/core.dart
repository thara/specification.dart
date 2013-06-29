part of specification;

abstract class Specification<T> {
  
  bool isSatisfiedBy(T candidate);
}

class NegationSpecification<T> extends Specification<T> with OperatorMixin<T> {
  
  final Specification<T> _s;

  NegationSpecification(this._s);

  Specification<T> get specification => this;
  
  bool isSatisfiedBy(T candidate) => _s.isSatisfiedBy(candidate) == false;
  
  int get hashCode => _s.hashCode * 17;
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is NegationSpecification<T> == false) return false;
    return this._s == (other as NegationSpecification<T>)._s;
  }

}