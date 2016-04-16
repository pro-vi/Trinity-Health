Feature: Add collaborator
  As a collaborating physician
  I want to be add collaborators to a specific cases
  so that I can share case information with them and receive their input on treatment options

Background: Set up Clinicians
  Given I am on the clinician sign up page
  When I fill in the following:
    | Name                  | Ben Carson      |
    | Email                 | carson@ucsf.org |
    | Password              | bencarson       |
    | Password confirmation | bencarson       |
  And I press "Sign up"
  And I log out
  Given I am on the clinician sign up page
  When I fill in the following:
    | Name                  | Sanjay Gupta   |
    | Email                 | gupta@ucsf.org |
    | Password              | sunjaygupta    |
    | Password confirmation | sunjaygupta    |
  And I press "Sign up"
  
  
  Given "Sanjay Gupta" creates the following cases:
     | name              | diagnosis    | id |
     | John Doe          | Cancer       | 15 |
  
  Scenario: Add a collaborator
    Given I am on "Sanjay Gupta"'s case page for "John Doe"
    Then I should see "Add collaborator"
    When I follow "Add collaborator"
    Then I follow "Select as collaborator"
    Then I should be on "Sanjay Gupta"'s case page for "John Doe"
    Then I should see "Ben Carson"
    
  Scenario: Should not be able to select self as collaborator
    Given I am on "Sanjay Gupta"'s case page for "John Doe"
    Then I follow "Add collaborator"
    Then I should not see "Sanjay Gupta"
  