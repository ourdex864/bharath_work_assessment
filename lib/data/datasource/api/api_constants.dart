enum APIEnpoint { question, answer }

extension APIEnpointsExtension on APIEnpoint {
  APIRequestType get requestType {
    switch (this) {
      case APIEnpoint.question:
      case APIEnpoint.answer:
        return APIRequestType.get;
      default:
        return APIRequestType.post;
    }
  }

  String get path {
    switch (this) {
      case APIEnpoint.question:
        return "for_you";
      case APIEnpoint.answer:
        return "reveal";
    }
  }
}

enum APIRequestType { get, post, put, delete }
