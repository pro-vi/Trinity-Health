Feature: Add Note
  As a collaborating clinician,
  I want to be able to add notes to my patients' cases
  So that my colleagues can view any changes
  
  
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
    
  Scenario: Add a note
    Given that Sanjay Gupta is logged in
    Then I should see "John Doe"
    And I follow "John Doe"
    Then I should see "Notes"
    And I should follow "Notes"
    Then I should see "Add Note"
    And I follow "Add Note"
    Then I fill in "Subject" with "Prognosis update"
    Then I fill in "Note" with "Successful surgery"
    Then I press "Submit"
    
  Scenario: Add a note
    Given that Sanjay Gupta is logged in
    Then I should see "John Doe"
    And I follow "John Doe"
    Then I should see "Notes"
    And I should follow "Notes"
    Then I should see "Add Note"
    And I follow "Add Note"
    Then I fill in "Subject" with "Prognosis update"
    Then I press "Submit"
    Then I should see "Please fill in note"
    
    
    
  
    