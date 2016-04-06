Feature: Edit Note
  As a collaborating clinician,
  I want to be able to edit notes to my patients' cases
  So that my colleagues can view any changes I've made in cases of misinformation8
  
  
  Given the following clinicians exists:
    | Name              | Email             |   Password      | Confirm Password    | id |
    | Dr. Sanjay Gupta  | gupta@ucsf.org    |  sunjaygupta    |     sunjaygupta     | 15 | 
    
  Given the following cases exist:
     | Name              | Diagnosis    | id |
     | John Doe          | Cancer       | 15 |
     | 
  Given the following patients exist:
    |id | clinician_id | case_id |
    |15 |      15      |    15   |
    
  Given the following notes exist:
    |      Subject          |      Author       |                    Note                      |  
    | Surgery Complication  |   gupta@ucsf.org  | Surgery was successful, but the patient died |
    
  Scenario: Edit an existing note
    Given that Sanjay Gupta is logged in
    Then I should see "John Doe"
    And I follow "John Doe"
    Then I should see "Notes"
    And I should follow "Notes"
    Then I press edit on note with Subject "Surgery Complication"
    And I fill in "Note" with "Patient did not die"
    Then I press "Save"
    Then I should see "Patient did not die"
    
    
    
  
    