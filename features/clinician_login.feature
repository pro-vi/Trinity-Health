Feature: Clinician Sign In
  
  As a collaborating physician
  I want to login with Trinity Health
  So that I can securely access my patient cases
  
  Given the following clinicians are signed up:
    | Name              | Email             |   Password      | Confirm Password    |
    | Dr. Sanjay Gupta  | gupta@ucsf.org    |  sunjaygupta    |     sunjaygupta     |
    | Dr. Ben Carson    | carson@ucsf.org   |   bencarson     |     bencarson       |
  
Scenario: Sign In
  When I go to the clinician sign in page
  And I fill in "Email" with "gupta@ucsf.org"
  And I fill in "Password" with "sanjaygupta"
  And I press "Log In"
  Then I should see "Signed in successfully"
  And I should be on my cases page

Scenario: Sign in Sad Path
  When I go to the clinician sign up page
  And I fill in "Email" with "carson@ucsf.org"
  And I fill in "Password" with "carson"
  And I press "Log In"
  Then I should see "Invalid email or password"
