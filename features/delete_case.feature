Feature: Delete case
  
  As a collaborating physician
  I want to delete old patient cases
  So that I can focus on my current patients
  
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
    
Scenario: Delete cases
    When I go to the cases page for "Sanjay Gupta"
    And I follow "Sally Mae"
    When I follow "Delete"
    Then I should be on the cases page for "Sanjay Gupta"
    Then I should not see "Sally Mae"
    
