require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))


Given /the following notes exist for "(.*)"/ do |patient, notes_table|
  c = Case.where(:name => patient)
  notes_table.hashes.each do |n|
    c.notes.create(n)
  end
end

Given /"(.*)" creates the following notes for "(.*)"/ do |clinician, patient, notes_table|
  c = Clinician.find_by_name(clinician)
  f = c.cases.find_by_name(patient)
  notes_table.hashes.each do |n|
    f.notes.create(n)
  end
end

Given /^I press edit on note with Subject "(.*)"$/ do |s|
    
end