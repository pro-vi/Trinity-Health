Feature: Edit Note
  As a collaborating clinician,
  I want to be able to edit notes to my patients' cases
  So that my colleagues can view any changes I've made in cases of misinformation8
  
  
  Given the following clinicians exists:
    | Name              | Email             |   Password      | Confirm Password    | id |
    | Dr. Sanjay Gupta  | gupta@ucsf.org    |  sunjaygupta    |     sunjaygupta     | 15 |
    | Dr. Hippocrates   | hippo@ucsf.org    |  hippocrates    |     hippocrates     | 20 |
    
  Given the following cases exist:
     | Name              | Diagnosis    | id |
     | John Doe          | Cancer       | 15 |
    
  Given the following patients exist:
    |id | clinician_id | case_id |
    |15 |      15      |    15   |
    
  Scenario: Edit an existing note
    Given that Sanjay Gupta is logged in
    Then I should see "John Doe"
    And I follow "John Doe"
    Then I should see "Manage Collaborators"
    Then I should see "Add Collaborators"
    And I fill in "Add Collaborators" with "hippo@ucsf.org"
    Then I should see "Manage Collaborators" before "Dr. Hippocrates"
    Then I should see "hippo@ucsf.org"
    
    
    
  