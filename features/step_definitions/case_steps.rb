require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /the following cases exist/ do |cases_table|
  cases_table.hashes.each do |c|
    Case.create(c)
  end
end

Given /"(.*)" creates the following cases/ do |n, cases_table|
  doc = Clinician.where(name: n)
  cases_table.hashes.each do |c|
    doc.cases.create(c)
  end
end

Then /^I should be on "(.*)"'s case page$/ do |name|
  c = Case.find_by name: name
  id = c.id
  visit path_to("/cases/#{id}")
end
