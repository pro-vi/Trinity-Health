require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^"(.*)" is logged in$/ do |name|
  Given %{I go to the }  
end
<<<<<<< HEAD
=======

Given /the following notes exist for "(.*)"/ do |patient, notes_table|
  c = Case.where(:name => patient)
  notes_table.hashes.each do |n|
    c.notes.create(n)
  end
end

Given /^I press edit on note with Subject "(.*)"$/ do |s|
    
end
>>>>>>> 6d348d075903e82541294b67b3fe37626197a79f
