class PatientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_patient, only: [:edit, :update, :destroy]
  #GET /patients
  def index
    @patients = Patient.all
  end

  #GET /patients/1
  def show
    if Patient.exists?(params[:id])
      set_patient
    else
      redirect_to patients_url
    end
  end

  #GET /patients/new
  def new
    @patient = Patient.new
  end

  #GET /patients/1/edit
  def edit
  end

  #POST /patients
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash.notice = "Patient record was created successfully"
      redirect_to @patient
    else
      flash.now.alert = @patient.errors.full_messages.to_sentence
      render :new
    end
  end

  #PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      flash.notice = "Patient record was updated successfully"
      redirect_to @patient
    else
      flash.now.alert = @patient.errors.full_messages.to_sentence
      render :edit
    end
  end

  #DETELE /patients/1
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_patient
    @patient = Patient.find(params[:id])
  end
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :sex, :ethnicity, :prev_etoh_use, :curr_etoh_use, :etoh_notes, :prev_smoking, :curr_smoking, :smoking_notes, :prev_drug_use, :curr_drug_use, :drug_notes, :illnesses, :surgeries, :allergies)
  end
  def catch_not_found(e)
    Rails.logger.debug("We had a not found exception.")
    flash.alert = e.to_s
    redirect_to patients_path
  end
end
