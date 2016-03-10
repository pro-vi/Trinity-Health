class CasesController < ApplicationController
    
    def case_params
        params.require(:case).permit(:name, :diagnosis)
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
