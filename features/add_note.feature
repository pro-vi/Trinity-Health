Feature: Add Note
  As a collaborating clinician,
  I want to be able to add notes to my patients' cases
  So that my colleagues can view any changes
  
Background: clinicians and cases exist
  
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
    
Scenario: Add a note
  Given I am on "Sanjay Gupta"'s case page for "John Doe"
  Then I should see "Notes"
  And I follow "Notes"
  Then I should see "Add Note"
  And I follow "Add Note"
  When I fill in "Subject" with "Prognosis update"
  Then I fill in "Note" with "Successful surgery"
  And I press "Create"
  Then I should be on "Sanjay Gupta"'s note page for "John Doe"
  And I should see "Successful surgery"
    
Scenario: Add a note sad path
  Given I am on "Sanjay Gupta"'s case page for "John Doe"
  And I follow "Notes"
  And I follow "Add Note"
  When I fill in "Subject" with "Prognosis update"
  And I press "Create"
  Then I should see "Please fill in note"
  
Scenario: Delete a note
  Given I am on "Sanjay Gupta"'s case page for "John Doe"
  And I follow "Notes"
  And I follow "Add Note"
  When I fill in "Subject" with "Prognosis update"
  Then I fill in "Note" with "Successful surgery"
  And I press "Create"
  Then I should be on "Sanjay Gupta"'s note page for "John Doe"
  And I should see "Delete"
  Then I follow "Delete"
  Then I should not see "Successful surgery"
