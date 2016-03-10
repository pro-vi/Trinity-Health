class CasesController < ApplicationController
    
    def case_params
        params.require(:case, :name, :diagnosis).permit(:age, :gender, :disease_characteristics, :treatment_history, :past_medical_history)
    end
    
    def show
        
    end
    
    def index
        
    end
    
    def new
        
    end
    
    def create
        
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
end
