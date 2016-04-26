Feature: Clinician Sign In
  
  As a collaborating physician
  I want to login with Trinity Health
  So that I can securely access my patient cases

Background:
  Given I am on the clinician sign up page
  When I fill in the following:
    | Name                  | Sanjay Gupta   |
    | Email                 | gupta@ucsf.org |
    | Password              | sanjaygupta    |
    | Password confirmation | sanjaygupta    |
  And I press "Sign up"
  And I log out
  
Scenario: Sign In
  When I go to the log in page
  And I fill in "Email" with "gupta@ucsf.org"
  And I fill in "Password" with "sanjaygupta"
  And I press "Log in"
  Then I should see "Signed in successfully"
  And I should be on the cases page for "Sanjay Gupta"

Scenario: Sign in Sad Path
  When I go to the log in page
  And I fill in "Email" with "carson@ucsf.org"
  And I fill in "Password" with "carson"
  And I press "Log in"
  Then I should see "Invalid email or password"
  
Scenario: Log out
  When I go to the log in page
  And I fill in "Email" with "gupta@ucsf.org"
  And I fill in "Password" with "sanjaygupta"
  And I press "Log in"
  Then I should see "Log out"
  When I follow "Log out"
  Then I should see "Signed out successfully"
