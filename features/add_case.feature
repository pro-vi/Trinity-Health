Feature: add a case to the list
  
  As a collaborating physician
  I want to create patient cases
  So that I can share case information with my colleagues and come up with an effective treatment plan
  
Background: Cases by Clinician

  Given the following cases exist:
  | Patient Name        | Age     | Gender  |   Diagnosis     |
  | Sally Mae           | 102     | F       |   Breast Cancer |
  | Freddie Mac         | 99      | M       |   Lung Cancer   |
  | Kanye West          | 8       | M       |       Flu       |
  | Somebody Else       | 50      | M       |     Diabetes    |
  
  Scenario: add case
    When I go to the home page for "Dr. Dre"
    And I follow "Add Case"
    Then I should be on the "Add Case" page
    Given I enter a patient name of "King Kong" and diagnosis of "Common Cold"
    And I follow "Save"
    Then I should be on the show page for patient "King Kong"
    
    
