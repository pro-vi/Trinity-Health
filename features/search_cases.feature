Feature: Search cases
  
  As a collaborating physician
  I want to search patient cases
  So that I can use those cases as resources to help create treatment plans for patients.
  
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
  | Steve Jobs          | 60      | M       |  Pancreatic Cancer |
 
 Scenario: Search by Diagnosis
    When I go to the cases page for "Sanjay Gupta"
    Then I should see "Sally Mae"
    Then I should see "Kanye West"
    Then I fill in "Search" with "cancer"
    Then I should see "Steve Jobs"
    Then I should not see "Kanye West"
    
 Scenario: Empty Search by Diagnosis
    When I go to the cases page for "Sanjay Gupta"
    Then I fill in "Search" with ""
    Then I should not see "Kanye West"
    Then I should see "No search results found"

 Scenario: Search by Gender
    When I go to the cases page for "Sanjay Gupta"
    And I fill in "Search" with "female"
    Then I should see "Sally Mae"
    Then I should not see "Steve Jobs"
    