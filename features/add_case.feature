Feature: add a case to the list
  
  As a collaborating physician
  I want to create patient cases
  So that I can share case information with my colleagues and come up with an effective treatment plan
  
Scenario: add case
  Given I am on the new_case page
  And I fill in "Name" with "King Kong"
  And I fill in "Diagnosis" with "Common Cold"
  And I press "Create Case"
  Then I should see "King Kong"
  And I should see "Common Cold"
