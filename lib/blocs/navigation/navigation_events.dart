part of 'navigation_bloc.dart';

abstract class NavigationEvent {
  NavigationEvent({@required this.destination});

  NavigationViewsEnum destination;

}

class NavigateTo extends NavigationEvent {
  NavigateTo({@required this.destination});

  NavigationViewsEnum destination;

  List<Object> get props => [destination];
}
