Feature: display a list of all cases
  
  As a collaborating physician
  I want to view all of my patient cases
  So that I can have all of my information in one place
  
Background: Cases by Clinician

  Given the following cases exist:
  | Patient Name        | Age     | Gender  |   Diagnosis     |
  | Sally Mae           | 102     | F       |   Breast Cancer |
  | Freddie Mac         | 99      | M       |   Lung Cancer   |
  | Kanye West          | 8       | M       |       Flu       |
  | Somebody Else       | 50      | M       |     Diabetes    |
    
Scenario: 
    When I go to the home page for "Dr. Dre"
    Then I should see "Sally Mae"
    Then I should see "Freddie Mac"
