Feature: Edit Note
  As a collaborating clinician,
  I want to be able to edit notes to my patients' cases
  So that my colleagues can view any changes I've made in cases of misinformation8
  
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
     
  Given "Sanjay Gupta" creates the following notes for "John Doe":
    |      subject           |                    note_text                      |  
    | Surgery Complication   | Surgery was successful, but the patient died      |
    
  Scenario: Edit an existing note
    Given I am on "Sanjay Gupta"'s edit "Surgery Complication" note for "John Doe"
    And I fill in "Note text" with "Patient did not die"
    Then I press "Update Note"
    Then I should see "Patient did not die"
    
  Scenario: Edit sad path
    Given I am on "Sanjay Gupta"'s edit "Surgery Complication" note for "John Doe"
    And I fill in "Note text" with ""
    Then I press "Update Note"
    Then I should see "Fields cannot be blank"
    
    
    
  
    