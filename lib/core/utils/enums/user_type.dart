enum UserType { worker, customer }

UserType? parseStringIntoEnum(String widgetTypeString) {
  for (UserType type in UserType.values) {
    if (type.toString() == 'WidgetType.$widgetTypeString') {
      return type;
    }
  }
  return null;
}

extension UserTypeStringExtension on UserType {
  String get value {
    switch (this) {
      case UserType.worker:
        return "worker";
      case UserType.customer:
        return "customer";
    }
  }
}
