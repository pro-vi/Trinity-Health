Feature: display a list of all cases
  
  As a collaborating physician
  I want to view all of my patient cases
  So that I can have all of my information in one place
  
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
    
Scenario: View cases
    When I go to the cases page for "Sanjay Gupta"
    Then I should see "Sally Mae"
    Then I should see "Kanye West"
    And I follow "Sally Mae"
    Then I should see "Breast Cancer"
