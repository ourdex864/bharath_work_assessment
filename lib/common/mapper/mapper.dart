// Abstract class to use it for mapping from data model to local models and vice versa
abstract class Mapper<I, D> {
  I itemFrom(D domainItem);

  D itemTo(I item);
}
