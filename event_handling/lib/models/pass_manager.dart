import 'registered_event.dart';

class PassManager {
  // Stores all successfully registered/purchased passes
  static final List<RegisteredEvent> myPasses = [];

  // Add a new pass
  static void addPass(RegisteredEvent pass) {
    // Prevent duplicate passes for the same event
    final alreadyExists = myPasses.any(
          (existingPass) =>
      existingPass.eventName == pass.eventName,
    );

    if (!alreadyExists) {
      myPasses.add(pass);
    }
  }

  // Check whether user already has a pass
  static bool hasPass(String eventName) {
    return myPasses.any(
          (pass) => pass.eventName == eventName,
    );
  }

  // Remove a pass if needed
  static void removePass(String passId) {
    myPasses.removeWhere(
          (pass) => pass.passId == passId,
    );
  }

  // Clear all passes
  static void clearPasses() {
    myPasses.clear();
  }

  // Get number of passes
  static int get passCount {
    return myPasses.length;
  }
}
