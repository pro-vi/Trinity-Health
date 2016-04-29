Tabulous.setup do

  tabs(:case_nav) do
    
    cases_tab do
      text          { 'Clinical Summary' }
      link_path     { params[:id] == nil ? clinician_case_path(params[:clinician_id], params[:case_id]) : clinician_case_path(params[:clinician_id], params[:id])}
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('show').of_controller('cases') }
    end
    
    documents_tab do
      text          { 'Documents' }
      link_path     { params[:id] == nil ? documents_path(params[:clinician_id], params[:case_id]) : documents_path(params[:clinician_id], params[:id]) }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('index').of_controller('attachments') }
    end

    notes_tab do
      text          { 'Notes' }
      link_path     { params[:id] == nil ? clinician_case_notes_path(params[:clinician_id], params[:case_id]) : clinician_case_notes_path(params[:clinician_id], params[:id])}
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('index').of_controller('notes') }
    end
    
    collaborators_tab do
      text          { 'Manage Collaborators' }
      link_path     { params[:id] == nil ? add_collaborator_path(params[:clinician_id], params[:case_id]) : add_collaborator_path(params[:clinician_id], params[:id])}
      visible_when  { current_clinician.id == params[:clinician_id] }
      enabled_when  { current_clinician.id == params[:clinician_id] }
      active_when   { in_action('add_collaborator').of_controller('cases') ;
                      in_action('assign_collaborator').of_controller('cases') }
    end


  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
    # or create your own renderer class and reference it here
    # renderer :default

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#fff'
    text_color '#444'
    active_tab_color '#56A5EC'
    hover_tab_color '#fff'
    inactive_tab_color '#eee'
    inactive_text_color '#888'
  end

end
