// Concrete implementation of Git (Low-level module)
class GitVersionControl {
  void commit(String message) {
    print("Committing changes to Git with message: $message");
  }
  
  void push() {
    print("Pushing changes to remote Git repository.");
  }
  
  void pull() {
    print("Pulling changes from remote Git repository.");
  }
}

// Concrete implementation of SVN (Low-level module)
class SVNVersionControl {
  void commit(String message) {
    print("Committing changes to SVN with message: $message");
  }
  
  void push() {
    print("SVN doesn't have push. Commits go directly to repository.");
  }
  
  void update() {
    print("Updating from SVN repository.");
  }
  
  // SVN uses different method names - inconsistent interface!
}

// DevelopmentTeam depends directly on concrete implementation (High-level module depends on low-level)
class DevelopmentTeam {
  // VIOLATION: Direct dependency on concrete Git class
  final GitVersionControl git;
  
  DevelopmentTeam(this.git);
  
  void makeCommit(String message) {
    git.commit(message);
  }
  
  void performPush() {
    git.push();
  }
  
  void performPull() {
    git.pull();
  }
  
  // What if we want to switch to SVN? We need to change the entire class!
}

// Another team that wants to use SVN - must create a completely separate class
class DevelopmentTeamSVN {
  // VIOLATION: Direct dependency on concrete SVN class
  final SVNVersionControl svn;
  
  DevelopmentTeamSVN(this.svn);
  
  void makeCommit(String message) {
    svn.commit(message);
  }
  
  void performPush() {
    // SVN doesn't have push - this is confusing
    svn.commit(message); // Wait, what message?
    // We don't have the message parameter here!
  }
  
  // SVN uses update instead of pull
  void performUpdate() {
    svn.update();
  }
  
  // This class is completely different from DevelopmentTeam!
}

// Bad example with hard-coded dependency
class BadDevelopmentTeam {
  // VIOLATION: Creating dependency internally (tight coupling)
  final GitVersionControl git = GitVersionControl();
  
  void makeCommit(String message) {
    git.commit(message);
  }
  
  void performPush() {
    git.push();
  }
  
  void performPull() {
    git.pull();
  }
  
  // Can't test this class without Git
  // Can't switch to SVN without modifying code
}

void main() {
  print("=== Problems with DIP Violation ===\n");
  
  // This team is stuck with Git forever
  var git = GitVersionControl();
  var team1 = DevelopmentTeam(git);
  
  print("Git Team:");
  team1.makeCommit("Initial commit");
  team1.performPush();
  team1.performPull();
  
  print("\nSVN Team:");
  // We need a completely different class for SVN
  var svn = SVNVersionControl();
  var team2 = DevelopmentTeamSVN(svn);
  
  team2.makeCommit("SVN commit");
  // team2.performPush(); // This doesn't exist!
  team2.performUpdate();
  
  print("\n=== Issues with Bad Design ===");
  print("1. DevelopmentTeam tightly coupled to GitVersionControl");
  print("2. Cannot easily switch to SVN or other VCS");
  print("3. Need duplicate code for each VCS type");
  print("4. Hard to test (can't mock dependencies)");
  print("5. Different VCS have inconsistent interfaces");
  print("6. High-level module depends on low-level modules (violates DIP)");
  print("7. Code reuse is impossible");
  print("8. Difficult to maintain and extend");
}