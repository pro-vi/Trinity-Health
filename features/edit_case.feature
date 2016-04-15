Feature: Edit case
  
  As a collaborating physician
  I want to edit my patients' cases
  So that my colleagues can view any updates to the case
  
Background: Cases by Clinician

Background: Cases by Clinician
  Given I am on the clinician sign up page
  When I fill in the following:
    | Name                  | Sanjay Gupta   |
    | Email                 | gupta@ucsf.org |
    | Password              | sunjaygupta    |
    | Password confirmation | sunjaygupta    |
  And I press "Sign up"
  
  Given "Sanjay Gupta" creates the following cases:
  | name                | age     | gender  |    diagnosis    |
  | Sally Mae           | 102     | F       |   Breast Cancer |
  | Freddie Mac         | 99      | M       |   Lung Cancer   |
  | Kanye West          | 8       | M       |       Flu       |
  | Somebody Else       | 50      | M       |     Diabetes    |
    
Scenario: Edit cases
    When I go to the cases page for "Sanjay Gupta"
    Then I should see "Sally Mae"
    When I follow "Sally Mae"
    Then I should see "Edit"
    Then I follow "Edit"
    Then I should be on "Sanjay Gupta"'s edit page for "Sally Mae"
    When I fill in "Diagnosis" with "Cardiovascular Disease"
    And I press "Update Case"
    Then I should see "Cardiovascular Disease"

Scenario: Sad path
    When I go to the cases page for "Sanjay Gupta"
    And I follow "Kanye West"
    When I follow "Edit"
    Then I should be on "Sanjay Gupta"'s edit page for "Kanye West"
    When I fill in "Diagnosis" with ""
    And I press "Update Case"
    Then I should see "Diagnosis can't be blank"

