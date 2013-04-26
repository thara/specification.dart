part of specification;

PredicateExpressionSpecification expr(Predicate predicate) {
  if (predicate == null) throw new ArgumentError("Predicate required.");
  return new PredicateExpressionSpecification(predicate);
}

class PredicateExpressionSpecification<T> extends PredicateSpecification<T> {
  
  PredicateExpressionSpecification(Predicate<T> predicate) : super(predicate);
  
  bool call(T candidate) => isSatisfiedBy(candidate);
}