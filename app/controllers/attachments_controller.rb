class AttachmentsController < ApplicationController
    def index
        @clinician = Clinician.find(params[:clinician_id])
        @case = Case.find(params[:id])
        @attachments = @case.attachments
        @allowed = @clinician.cases.where(id: @case.id).count > 0
    end
end
