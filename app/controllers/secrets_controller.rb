class SecretsController < ApplicationController
  before_action :set_secret, only: [:destroy]

  def new
    @secret = current_profile.secrets.build
  end

  def index
    @secrets = current_profile.secrets
  end

  def create
    @secret = current_profile.secrets.build(secret_params)

    respond_to do |format|
      if @secret.save
        format.html { redirect_to secrets_path, success: "Added" }
      else
        format.html { redirect_to new_secret_path, warning: @secret.errors.full_messages.first }
      end
    end
  end

  def destroy
    @secret.destroy!

    redirect_to secrets_path, success: "Secret #{@secret.name} was removed"
  end

  private
  def secret_params
    params.require(:secret).permit(:name, :vendor, :blob)
  end

  def set_secret 
    @secret = Secret.find(params[:id])
  end
end
