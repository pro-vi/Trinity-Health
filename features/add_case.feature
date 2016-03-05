Feature: add a case to the list
  
  As a collaborating physician
  I want to create patient cases
  So that I can share case information with my colleagues and come up with an effective treatment plan
  
Background: Cases by Clinician

  Scenario: add case
    When I go to the home page for "Dr. Dre"
    And I follow "Add Case"
    Then I should be on the "Add Case" page
    And I enter a patient name of "King Kong" and diagnosis of "Common Cold"
    And I follow "Save"
    Then I should be on the show page for patient "King Kong"
    
    
