Feature: Sign In
  
  As a collaborating physician
  I want to sign up and create an account login with Trinity Health
  So that I can securely access my patient cases
  
Scenario: Sign Up
  When I go to the clinician sign up page
  And I fill in "Name" with "Dr. Phillip Frost"
  And I fill in "Email" with "frost@ucsf.org"
  And I fill in "Password" with "password"
  And I fill in "Password confirmation" with "password"
  And I press "Sign up"
  Then I should see "You have signed up successfully"

Scenario: Sad Path
  When I go to the clinician sign up page
  And I fill in "Name" with "Dr. Phillip Frost"
  And I fill in "Email" with "frost@ucsf.org"
  And I fill in "Password" with "passwor"
  And I fill in "Password confirmation" with "passwor"
  And I press "Sign up"
  Then I should see "Password is too short"
