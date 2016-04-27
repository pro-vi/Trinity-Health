Feature: add a case to the list
  
  As a collaborating physician
  I want to create patient cases
  So that I can share case information with my colleagues and come up with an effective treatment plan
Background: Login
  Given I am on the clinician sign up page
  When I fill in the following:
    | Name                  | Sanjay Gupta   |
    | Email                 | gupta@ucsf.org |
    | Password              | sunjaygupta    |
    | Password confirmation | sunjaygupta    |
  And I press "Sign up"
  
  
Scenario: Add case
  When I am on the new case page for "gupta@ucsf.org"
  And I fill in "Name" with "King Kong"
  And I fill in "Diagnosis" with "Common Cold"
  And I press "Create Case"
  Then I should see "King Kong"
  And I should see "Common Cold"
  
Scenario: Cancel adding case
  When I am on the new case page for "gupta@ucsf.org"
  And I follow "Cancel"
  Then I should be on the cases page for "Sanjay Gupta"

Scenario: Sad path if user doesn't put all required fields for new case
  When I am on the new case page for "gupta@ucsf.org"
  And I fill in "Name" with "King Kong"
  And I press "Create Case"
  Then I should see "error prohibited this case from being created"
  Then I am on the new case page for "gupta@ucsf.org"
