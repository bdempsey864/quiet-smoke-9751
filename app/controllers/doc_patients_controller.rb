class DocPatientsController < ApplicationController
  def destroy
    DocPatient.where(patient_id: params[:id])
    redirect_to doctor_path
  end
end