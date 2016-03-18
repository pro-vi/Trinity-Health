Feature: Delete case
  
  As a collaborating physician
  I want to delete old patient cases
  So that I can focus on my current patients
  
Background: Cases by Clinician

  Given the following cases exist:
  | name                | age     | gender  |    diagnosis    |
  | Sally Mae           | 102     | F       |   Breast Cancer |
  | Freddie Mac         | 99      | M       |   Lung Cancer   |
  | Kanye West          | 8       | M       |       Flu       |
  | Somebody Else       | 50      | M       |     Diabetes    |
    
Scenario: Delete cases
    When I go to the home page
    Then I should see "Sally Mae"
    When I follow "Sally Mae"
    Then I should see "Delete"

Scenario: Verify deletes are successful
    Given I am on the home page
    When I follow "Sally Mae"
    And I press "Delete"
    Then I should be on home page
    And I should not see "Sally Mae"
    
