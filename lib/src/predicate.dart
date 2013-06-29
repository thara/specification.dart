part of specification;

typedef bool Predicate<T>(T candidate);

class PredicateSpecification<T> extends Specification<T> with OperatorMixin<T> {
  
  final Predicate<T> _predicate;
  
  PredicateSpecification(this._predicate);
  
  bool isSatisfiedBy(T candidate) => _predicate(candidate);
  
  Specification<T> get specification => this;
    
  int get hashCode => _predicate.hashCode;
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is PredicateSpecification<T> == false) return false;
    return this._predicate == (other as PredicateSpecification<T>)._predicate;
  }

  
}