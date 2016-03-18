Feature: Edit case
  
  As a collaborating physician
  I want to edit my patients' cases
  So that my colleagues can view any updates to the case
  
Background: Cases by Clinician

  Given the following cases exist:
  | name                | age     | gender  |    diagnosis    |
  | Sally Mae           | 102     | F       |   Breast Cancer |
  | Freddie Mac         | 99      | M       |   Lung Cancer   |
  | Kanye West          | 8       | M       |       Flu       |
  | Somebody Else       | 50      | M       |     Diabetes    |
    
Scenario: Edit cases
    When I go to the home page
    Then I should see "Sally Mae"
    When I follow "Sally Mae"
    Then I should see "Edit"

Scenario: Verify edits are saved
    Given I am on the home page
    And I follow "Sally Mae"
    When I follow "Sally Mae"
    When I click "Edit"
    Then I should be on the edit page for "Sally Mae"
    Then I fill in "Diagnosis" with "Cardiovascular Disease"
    Then I press "Save"
    Then I should be on home page
    Then I should see "Cardiovascular Disease"
    
