part of specification;

abstract class CompositeSpecification<T>
    extends Specification<T> with OperatorMixin<T> {

  Specification<T> get specification => this;
  
  List<Specification<T>> _components;
  
  int get hashCode => _components.fold(17, (h, s) => 31 * h + s.hashCode);
}

class ConjunctionSpecification<T> extends CompositeSpecification<T> {
  
  final Specification<T> _s1;
  final Specification<T> _s2;
  
  ConjunctionSpecification._(this._s1, this._s2);
  
  ConjunctionSpecification(this._s1, this._s2) {
    _components = [this._s1, this._s2];
  }
  
  bool isSatisfiedBy(T candidate) =>
      _s1.isSatisfiedBy(candidate) && _s2.isSatisfiedBy(candidate); 
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is ConjunctionSpecification<T> == false) return false;
    var otherSpec = (other as ConjunctionSpecification<T>);
    return this._s1 == otherSpec._s1 && this._s2 == otherSpec._s2;
  }
}

class DisjunctionSpecification<T> extends CompositeSpecification<T> {
  
  final Specification<T> _s1;
  final Specification<T> _s2;
  
  DisjunctionSpecification(this._s1, this._s2) {
    _components = [this._s1, this._s2];
  }
  
  bool isSatisfiedBy(T candidate) =>
      _s1.isSatisfiedBy(candidate) || _s2.isSatisfiedBy(candidate);
  
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is DisjunctionSpecification<T> == false) return false;
    var otherSpec = (other as DisjunctionSpecification<T>);
    return this._s1 == otherSpec._s1 && this._s2 == otherSpec._s2;
  }
}