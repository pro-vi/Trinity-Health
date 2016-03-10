require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /the following cases exist/ do |cases_table|
  cases_table.hashes.each do |c|
    Case.create(c)
  end
end