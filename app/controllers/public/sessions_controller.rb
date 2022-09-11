# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController



before_action  :customer_state, only: [:create]


protected
  #退会しているかを確認するメソッド
  def customer_state

    #入力された email から該当のアカウントを取得
    @customer = Customer.find_by(email: params[:customer][:email])
    #アカウントを取得できなかった場合、このメソッドを終了
    return if !@customer
    #取得できた場合、パスワードが一致しているか判別
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == false)
      redirect_to new_customer_registration_path
    end

  end

end



  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

