class ConfirmationsController < ApplicationController
  def show
    user = User.find_by(confirmation_token: params[:token])
    
    if user.present?
      user.confirm!
      redirect_to user, notice: I18n.t('confirmations.success')
    else
      redirect_to root_path, notice: I18n.t('confirmations.unsuccess')
    end
  end
end