class ProvidersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_provider, only: [:edit, :update, :destroy]

  #GET /providers
  def index
    @providers = Provider.all
  end

  #GET /providers/1
  def show
    if Provider.exists?(params[:id])
      set_provider
    else
      redirect_to providers_url
    end
  end

  #GET /providers/new
  def new
    @provider = Provider.new
  end

  #GET /providers/1/edit
  def edit
  end

  #POST /providers
  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      flash.notice = "Provider record was created successfully"
      redirect_to @provider
    else
      flash.now.alert = @provider.errors.full_messages.to_sentence
      render :new
    end
  end

  #PATCH/PUT /providers/1
  def update
    if @provider.update(provider_params)
      flash.notice = "Provider record was updated successfully"
      redirect_to @provider
    else
      flash.now.alert = @provider.errors.full_messages.to_sentence
      render :edit
    end
  end

  #DELETE /providers/1
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html {
        redirect_to providers_url, notice: "Provider was destroyed successfully"
      }
      format.json {
        head :no_content
      }
    end
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:first_name, :last_name, :sex, :languages, :specialty)
  end

  def catch_not_found(e)
    Rails.logger.debug("We had a not found exception.")
    flash.alert = e.to_s
    redirect_to providers_path
  end

end
