# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # facebook callback
  # def facebook
  #   @user = User.create_from_provider_data(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     sign_in_and_redirect @user
  #     set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
  #   else
  #     flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
  #     redirect_to new_user_registration_url
  #   end 
  # end

  def facebook
    @user = Identity.find_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication               
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = Identity.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end
end
