import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard, {stateMachineName = "State Machine 1"}) {
    // StateMachineController? controller =
    //     StateMachineController.fromArtboard(artboard, "State Machine 1");
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    artboard.addController(
        controller!); //This ensures that the StateMachine will be updated whenever the Artboard changes.
    return controller; // This allows the function to be used to get a reference to the StateMachineController for the given Artboard.
  }
}
