class UserController < ApplicationController

  def create
    user = User.create(user_params)
    user.password_required!
    if user.save
      log_on_user(user)
      return render json: { success: true }
    end
    render json: {
      success: false,
      message: I18n.t('login.errors', errors: user.errors.full_messages.join("\n"))
    }
  rescue ActiveRecord::StatementInvalid
    render json: { success: false, message: I18n.t('login.something_already_taken') }
  end

  def check_email
    if User.email_available?(user_params)
      render json: { available: true }
    else
      render json: { available: false }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
