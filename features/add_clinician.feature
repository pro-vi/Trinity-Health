Feature: Add clinician
  
  As a collaborating physician
  I want to create a clinician profile
  So that I can add and share my patient cases with my colleagues
  
Scenario: Create profile
  When I go to the create "Clinician" page
  And I fill in "Name" with "Dr. Patrick Soon Shiong"
  And I fill in "Speciality" with "Oncology"
  And I press "Save"
  Then I should be on the home page
  Then I should see "Profile"
  Then I follow "Profile"
  Then I should see "Dr. Patrick Soon Shiong"
  Then I should see "Oncology"
