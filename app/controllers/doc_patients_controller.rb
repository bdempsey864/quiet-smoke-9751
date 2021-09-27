class DocPatientsController < ApplicationController
  def destroy
    DocPatient.where(patient_id: params[:id]).destroy_all
    redirect_to doctor_path
  end
end