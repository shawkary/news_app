abstract class NewsStates {}

class InitialNewsState extends NewsStates {}

class ChangeBottomNavBarIndex extends NewsStates {}

class LoadingGetBusinessState extends NewsStates {}
class SuccessGetBusinessState extends NewsStates {}
class ErrorGetBusinessState extends NewsStates {}

class LoadingGetScienceState extends NewsStates {}
class SuccessGetScienceState extends NewsStates {}
class ErrorGetScienceState extends NewsStates {}

class LoadingGetSportsState extends NewsStates {}
class SuccessGetSportsState extends NewsStates {}
class ErrorGetSportsState extends NewsStates {}

class LoadingGetSearchState extends NewsStates {}
class SuccessGetSearchState extends NewsStates {}
class ErrorGetSearchState extends NewsStates {}

class SuccessFillListsOfArticlesState extends NewsStates {}