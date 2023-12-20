enum CraftType {
  metalworking,
  jewelry,
  pottery,
  sculpture,
  woodworking,
  cabinetMaking,
  marquetry,
  lacquerware,
  woodBurning,
  woodTurningx,
  balloonAnimal,
  beadwork,
  dollMaking,
  dollhouseConstructionAndFurnishing,
  eggDecorating,
  etching,
  glassblowing,
  lapidary,
  mosaics,
  stainedGlass,
  toyMaking,
  polymerClay,
}

CraftType? parseStringIntoEnum(String craftTypeString) {
  for (CraftType type in CraftType.values) {
    if (type.toString() == 'WidgetType.$craftTypeString') {
      return type;
    }
  }
  return null;
}

extension UserTypeStringExtension on CraftType {
  String get value {
    switch (this) {
      case CraftType.metalworking:
        return "Metal working";
      case CraftType.jewelry:
        return "Gewelry";
      case CraftType.pottery:
        return "Pottery";
      case CraftType.sculpture:
        return "Sculpture";
      case CraftType.woodworking:
        return "Wood Working";
      case CraftType.cabinetMaking:
        return "Cabinet making";
      case CraftType.marquetry:
        return "Marquetry";
      case CraftType.lacquerware:
        return "Lacquerware";
      case CraftType.woodBurning:
        return "Wood burning";
      case CraftType.woodTurningx:
        return "Wood turningx";
      case CraftType.balloonAnimal:
        return "Balloon animal";
      case CraftType.beadwork:
        return "Beadwork";
      case CraftType.dollMaking:
        return "Doll Making";
      case CraftType.dollhouseConstructionAndFurnishing:
        return "Dollhouse construction and furnishing";
      case CraftType.eggDecorating:
        return "Egg Decorating";
      case CraftType.etching:
        return "Etching";
      case CraftType.glassblowing:
        return "Glassblowing";
      case CraftType.lapidary:
        return "Lapidary";
      case CraftType.mosaics:
        return "Mosaics";
      case CraftType.stainedGlass:
        return "Stained Glass";
      case CraftType.toyMaking:
        return "Toy Making";
      case CraftType.polymerClay:
        return "Polymer Clay";
    }
  }
}
