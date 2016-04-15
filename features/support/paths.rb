# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      cases_path

    when /^"(.*)"'s edit page for "(.*)"$/
      edit_clinician_case_path(Clinician.find_by_name($1), Case.find_by_name($2))
      
    when /^the create clinician page$/
      new_clinician_path
      
    when /^the clinicians page$/
      clinicians_path
      
    when /^the log in page$/
      new_clinician_session_path
      
    when /^the clinician sign up page$/
      new_clinician_registration_path
  
    when /^the new case page for "(.*)"$/
      new_clinician_case_path(Clinician.find_by_email($1))
    
    when /^"(.*)"'s case page for "(.*)"$/
      clinician_case_path(Clinician.find_by_name($1), Case.find_by_name($2))
      
    when /^"(.*)"'s note page for "(.*)"$/
      clinician_case_notes_path(Clinician.find_by_name($1), Case.find_by_name($2))

    when /^"(.*)"'s edit "(.*)" note for "(.*)"$/
      edit_clinician_case_note_path(Clinician.find_by_name($1), Case.find_by_name($3), Note.find_by_subject($2))
      
    when /^the cases page for "(.*)"$/
      clinician_cases_path(Clinician.find_by_name($1))
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
   
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
