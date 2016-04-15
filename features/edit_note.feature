Feature: Edit Note
  As a collaborating clinician,
  I want to be able to edit notes to my patients' cases
  So that my colleagues can view any changes I've made in cases of misinformation8
  
Background: clinicians and cases exist
  
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
    
  Given the following notes exist for "John Doe":
    |      Subject          |      Author       |                    Note                      |  
    | Surgery Complication  |   gupta@ucsf.org  | Surgery was successful, but the patient died |
    
  Scenario: Edit an existing note
    Given I am on the notes page for "John Doe"
    And I press edit on note with Subject "Surgery Complication"
    And I fill in "Note" with "Patient did not die"
    Then I press "Save"
    Then I should see "Patient did not die"
    
  Scenario: Edit sad path
    Given I am on the notes page for "John Doe"
    And I press edit on note with Subject "Surgery Complication"
    And I fill in "Note" with ""
    Then I press "Save"
    Then I should see "Error"
    
    
    
  
    