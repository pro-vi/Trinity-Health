class AttachmentsController < ApplicationController
    def index
        @clinician = Clinician.find(params[:clinician_id])
        @case = Case.find(params[:id])
        @attachments = @case.attachments
    end
end
