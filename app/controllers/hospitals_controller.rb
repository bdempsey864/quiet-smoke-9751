class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @unique_universities = Hospital.unique_universities(params[:id])
  end
end