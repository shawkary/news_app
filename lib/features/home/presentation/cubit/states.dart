abstract class NewsStates {}

class InitialNewsState extends NewsStates {}

class ChangeBottomNavBarIndex extends NewsStates {}

class LoadingGetBusinessState extends NewsStates {}
class SuccessGetBusinessState extends NewsStates {}
class ErrorGetBusinessState extends NewsStates {}