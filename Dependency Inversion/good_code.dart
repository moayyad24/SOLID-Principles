// Interface for version control system (Abstraction)
abstract class IVersionControl {
  void commit(String message);
  void push();
  void pull();
}

// Git version control implementation (Low-level module)
class GitVersionControl implements IVersionControl {
  @override
  void commit(String message) {
    print("Committing changes to Git with message: $message");
  }

  @override
  void push() {
    print("Pushing changes to remote Git repository.");
  }

  @override
  void pull() {
    print("Pulling changes from remote Git repository.");
  }
}

// SVN version control implementation (Another low-level module)
class SVNVersionControl implements IVersionControl {
  @override
  void commit(String message) {
    print("Committing changes to SVN with message: $message");
  }

  @override
  void push() {
    print("SVN uses commit, not push. Changes already committed.");
  }

  @override
  void pull() {
    print("Updating from SVN repository.");
  }
}

// Mercurial version control implementation (Another low-level module)
class MercurialVersionControl implements IVersionControl {
  @override
  void commit(String message) {
    print("Committing changes to Mercurial with message: $message");
  }

  @override
  void push() {
    print("Pushing changes to remote Mercurial repository.");
  }

  @override
  void pull() {
    print("Pulling changes from remote Mercurial repository.");
  }
}

// Team class that depends on abstraction, not concrete implementation (High-level module)
class DevelopmentTeam {
  final IVersionControl versionControl;
  
  // Dependency injection through constructor
  DevelopmentTeam(this.versionControl);
  
  void makeCommit(String message) {
    versionControl.commit(message);
  }
  
  void performPush() {
    versionControl.push();
  }
  
  void performPull() {
    versionControl.pull();
  }
  
  // Can easily switch version control systems without changing this class
  void changeVersionControl(IVersionControl newVersionControl) {
    // In a real scenario, you might have a setter or create a new instance
    print("Switching version control system...");
  }
}

void main() {
  print("=== Using Git ===\n");
  GitVersionControl git = GitVersionControl();
  DevelopmentTeam team1 = DevelopmentTeam(git);
  
  team1.makeCommit("Initial commit");
  team1.performPush();
  team1.performPull();
  
  print("\n=== Using SVN ===\n");
  SVNVersionControl svn = SVNVersionControl();
  DevelopmentTeam team2 = DevelopmentTeam(svn);
  
  team2.makeCommit("Added new feature");
  team2.performPush();
  team2.performPull();
  
  print("\n=== Using Mercurial ===\n");
  MercurialVersionControl hg = MercurialVersionControl();
  DevelopmentTeam team3 = DevelopmentTeam(hg);
  
  team3.makeCommit("Bug fixes");
  team3.performPush();
  team3.performPull();
}