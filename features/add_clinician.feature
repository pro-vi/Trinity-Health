Feature: Add clinician
  
  As a collaborating physician
  I want to create a clinician profile
  So that I can add and share my patient cases with my colleagues
  
Scenario: Create profile
  When I go to the create clinician page
  And I fill in "Name" with "Dr. Patrick Soon Shiong"
  And I fill in "Email" with "p.s.shiong@ucsf.org"
  And I fill in "Specialty" with "Oncology"
  And I press "Create Clinician"
  Then I should see "Dr. Patrick Soon Shiong"
  And I should see "Oncology"

Scenario: Sad Path
  When I go to the create clinician page
  And I fill in "Name" with "Dr. Patrick Soon Shiong"
  And I fill in "Email" with ""
  And I fill in "Specialty" with "Oncology"
  And I press "Create Clinician"
  Then I should be on the clinicians page
  Then I should see "There was a problem creating the clinician"
