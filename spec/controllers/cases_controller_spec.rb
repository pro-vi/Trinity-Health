require 'spec_helper'

describe CasesController do
    
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
    it "renders the new template" do
        get :new
        expect(response).to render_template("new")
    end
end