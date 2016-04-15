Feature: Add collaborator
  As a collaborating physician
  I want to be add collaborators to a specific cases
  so that I can share case information with them and receive their input on treatment options
  
  Given I am on the log in page
  When I fill in the following:
    | Name                  | Hippocrates    |
    | Email                 | hippo@ucsf.org |
    | Password              | hippocrates    |
    | Password confirmation | hippocrates    |
  And I press "Sign up"
  
  Given I am on the log in page
  When I fill in the following:
    | Name                  | Sanjay Gupta   |
    | Email                 | gupta@ucsf.org |
    | Password              | sunjaygupta    |
    | Password confirmation | sunjaygupta    |
  And I press "Sign up"
  
  Given "Sanjay Gupta" creates the following cases:
     | Name              | Diagnosis    | id |
     | John Doe          | Cancer       | 15 |
    
  Scenario: Add a collaborator
    Given I am on the case page for "John Doe"
    Then I should see "Manage Collaborators"
    Then I should see "Add Collaborators"
    When I fill in "Add Collaborators" with "hippo@ucsf.org"
    And I press "Add"
    Then I should see "Manage Collaborators"
    Then I should see "hippo@ucsf.org"
    
  Scenario: Sad path
    Given I am on the case page for "John Doe"
    Then I should see "Manage Collaborators"
    Then I should see "Add Collaborators"
    When I fill in "Add Collaborators" with ""
    And I press "Add"
    Then I should see "Manage Collaborators"
    Then I should see "error"
  