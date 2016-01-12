class RegistrationsController < Devise::RegistrationsController

  protected

  def disable_nav
    true
  end

  private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:name, :avatar, :company, :function, :linkedin, :twitter, :email, :password, :password_confirmation, :current_password)
    end
end
