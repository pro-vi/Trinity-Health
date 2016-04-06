Feature: Sign In
  
  As a collaborating physician
  I want to sign up and create an account login with Trinity Health
  So that I can securely access my patient cases
  
Scenario: Sign Up
  When I go to the clinician sign up page
  And I fill in "Name" with "Dr. Phillip Frost"
  And I fill in "Email" with "frost@ucsf.org"
  And I fill in "Password" with "password"
  And I fill in "Confirm Password" with "password"
  And I press "Sign Up"
  Then I should see "You've successfully signed up"


Scenario: Sad Path
  When I go to the clinician sign up page
  And I fill in "Name" with "Dr. Phillip Frost"
  And I fill in "Email" with "frost@ucsf.org"
  And I fill in "Password" with "passwor"
  And I fill in "Confirm Password" with "passwor"
  And I press "Sign Up"
  Then I should see "Error"
