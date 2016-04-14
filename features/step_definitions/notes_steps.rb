require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^"(.*)" is logged in$/ do |name|
end

Given /the following notes exist for "(.*)"/ do |patient, notes_table|
  c = Case.where(:name => patient)
  notes_table.hashes.each do |n|
    c.notes.create(n)
  end
end

Given /^I press edit on note with Subject "(.*)"$/ do |s|
    
end

Given /the following notes exist for "(.*)"/ do |patient, notes_table|
  c = Case.where(:name => patient)
  notes_table.hashes.each do |n|
    c.notes.create(n)
  end
end

Given /^I press edit on note with Subject "(.*)"$/ do |s|
    
end