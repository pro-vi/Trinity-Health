Feature: Attach files
  
  As a collaborating physician
  I want to attach lab and imaging documents to a patient's case
  So that I can share those resources with my colleagues.
  
Background: Clinician login + Create cases
  
  Given I am on the clinician sign up page
  When I fill in the following:
    | Name                  | Sanjay Gupta   |
    | Email                 | gupta@ucsf.org |
    | Password              | sunjaygupta    |
    | Password confirmation | sunjaygupta    |
  And I press "Sign up"
  When I am on the new case page for "gupta@ucsf.org"
  And I fill in "Name" with "King Kong"
  And I fill in "Diagnosis" with "Common Cold"
  And I press "Create Case"
  
  
Scenario: No Attached Files
  Given I attach the file "TestImage.jpg" to "King Kong"'s case
  Given I am on "Sanjay Gupta"'s case page for "King Kong"
  Then I should see "Documents"
  Then I follow "Documents"
  Then I should not see "No attached documents."
    
Scenario: Successfully attach file to case 
  Given I am on "Sanjay Gupta"'s case page for "King Kong"
  Then I should see "Documents"
  And I follow "Documents"
  Then I should see "No attached documents."

# Scenario: Attach Empty File
#   Given I am on "Sanjay Gupta"'s case page for "Steve Jobs"
#   Then I should see "Documents"
#   And I follow "Documents"
#   Then I press "Attach Files"
#   When I attach the file at "" to "Steve Jobs"'s case #need to install webrat
#   Then I press "Upload"
#   And I should see "File(s) could not be uploaded"