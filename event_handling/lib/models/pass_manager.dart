import 'registered_event.dart';

class PassManager {
  // ============================================================
  // STORES ALL SUCCESSFULLY REGISTERED / PURCHASED PASSES
  // ============================================================

  static final List<RegisteredEvent> myPasses = [];

  // ============================================================
  // ADD PASS
  // ============================================================

  static void addPass(RegisteredEvent pass) {
    // Prevent duplicate registration for same event
    final alreadyExists = myPasses.any(
          (existingPass) =>
      existingPass.eventName == pass.eventName,
    );

    if (!alreadyExists) {
      myPasses.add(pass);
    }
  }

  // ============================================================
  // CHECK WHETHER USER ALREADY HAS A PASS
  // ============================================================

  static bool hasPass(String eventName) {
    return myPasses.any(
          (pass) => pass.eventName == eventName,
    );
  }

  // ============================================================
  // REMOVE PASS
  // ============================================================

  static void removePass(String passId) {
    myPasses.removeWhere(
          (pass) => pass.passId == passId,
    );
  }

  // ============================================================
  // CLEAR ALL PASSES
  // ============================================================

  static void clearPasses() {
    myPasses.clear();
  }

  // ============================================================
  // NUMBER OF PASSES
  // ============================================================

  static int get passCount {
    return myPasses.length;
  }
}