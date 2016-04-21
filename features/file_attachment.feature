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
  
  Given "Sanjay Gupta" creates the following cases:
  | name                | age     | gender  |    diagnosis    |
  | Sally Mae           | 102     | F       |   Breast Cancer |
  | Freddie Mac         | 99      | M       |   Lung Cancer   |
  | Kanye West          | 8       | M       |       Flu       |
  | Somebody Else       | 50      | M       |     Diabetes    |
  | Steve Jobs          | 60      | M       |  Pancreatic Cancer |
  | 
Scenario: Successfully attach file to case
  Given I am on "Sanjay Gupta"'s case page for "Steve Jobs"
  Then I should see "Documents"
  And I follow "Documents"
  When I select "Attach Files"
  When I attach the file at "" to "Steve Jobs"'s case #need to install webrat
  Then I press "Upload"
  And I should see "File(s) successfully uploaded"
    

Scenario: Attach Empty File
  Given I am on "Sanjay Gupta"'s case page for "Steve Jobs"
  Then I should see "Documents"
  And I follow "Documents"
  When I select "Attach Files"
  When I attach the file at "" to "Steve Jobs"'s case #need to install webrat
  Then I press "Upload"
  And I should see "File(s) could not be uploaded"