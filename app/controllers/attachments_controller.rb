class AttachmentsController < ApplicationController
    
    
    def index
        @case = Case.find(params[:id])
        @attachments = @case.attachments
    end
end
