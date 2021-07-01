class VisitsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_visit, only: [:edit, :update, :destroy]

  #GET /visits
  def index
    @visits = Visit.all
  end

  #GET /visits/1
  def show
    if Visit.exists?(params[:id])
      set_visit
    else
      redirect_to visits_url
    end
  end

  #GET /visits/new
  def new
    @visit = Visit.new
  end

  #GET /visits/1/edit
  def edit
  end

  #POST /visits
  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      flash.notice = "Visit record was created successfully."
      redirect_to @visit
    else
      flash.now.alert = @visit.errors.full_messages.to_sentence
      render :new
    end
  end

  #PATCH/PUT /visits/1
  def update
    if @visit.update(visit_params)
      flash.notice = "Visit record was updated successfully."
      redirect_to @visit
    else
      flash.now.alert = @visit.errors.full_messages.to_sentence
      render :edit
    end
  end

  #DELETE /visits/1
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html {
        redirect_to visits_url, notice: "Visit was destroyed successfully."
      }
      format.json {
        head :no_content
      }
    end
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:visit_datetime, :temperature, :height, :weight, :pulse, :bp_sys, :bp_dia, :complaint, :referrals, :patient_id, :provider_id)
  end

  def catch_not_found(e)
    Rails.logger.debug("We had a not found exception.")
    flash.alert = e.to_s
    redirect_to visits_path
  end

end
