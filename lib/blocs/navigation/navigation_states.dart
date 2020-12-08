part of 'navigation_bloc.dart';


abstract class NavigationState  {

}

class HomePageState extends NavigationState {
  
}
class CreateNoteState extends NavigationState {


}

enum NavigationViewsEnum {
  homeView,
  createNoteView,
}