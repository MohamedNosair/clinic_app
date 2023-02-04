abstract class PackageDetailsStates {}

class PackageDetailsInitialState extends PackageDetailsStates {}

class PackageDetailsChangeLikeBottomState extends PackageDetailsStates {}


class PackageDetailsLoadingState extends PackageDetailsStates{}

class PackageDetailsSuccessState extends PackageDetailsStates{}

class PackageDetailsErrorState extends PackageDetailsStates{}