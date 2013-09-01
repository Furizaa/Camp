class SessionController < ApplicationController

  def create
    @user = User.where(email: session_params[:email].downcase).first
    if @user.present? && @user.confirm_password?(session_params[:password])
      log_on_user(@user)
      return render json: @user
    end

    render json: { error: I18n.t('login.incorrect_username_or_password')}
  end

  def destroy
    clear_current_user!
    render nothing: true
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
