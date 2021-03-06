import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigation_states.dart';
part 'navigation_events.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomePageState());

  NavigationViewsEnum destination = NavigationViewsEnum.homeView;

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateTo){
      yield* _mapNavigateToToState(event);
    }
  }
  Stream<NavigationState> _mapNavigateToToState(NavigateTo event) async* {
    destination = event.destination;
    if (event.destination == NavigationViewsEnum.createNoteView){
      yield CreateNoteState();
    } else if (event.destination == NavigationViewsEnum.homeView){
      yield HomePageState();

    }
  }

  //   @override
  //  void onTransition(Transition<NavigationEvent, NavigationState> transition) {
  //    print("Current state of navigation bloc: ${transition.currentState}");
  //    print("Most recent navigation bloc event: ${transition.event}");
  //    print("Next destination: ${transition.event.destination}");
  //    print("Next state of navigation bloc: ${transition.nextState}");

  //    super.onTransition(transition);
  

  //  }
  
}