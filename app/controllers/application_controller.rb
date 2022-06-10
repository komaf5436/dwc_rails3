class ApplicationController < ActionController::Base
  # 下記のように記述することで、devise利用の機能(ユーザー登録、ログイン認証など)が使用される前にconfigure_...メソッドが実行される。
  before_action :configure_permitted_parameters, if: :devise_controller?

  # after_sign_in...メソッドによって、サインイン後の遷移先を設定することが出来る。
  def after_sign_in_path_for(resource)
    post_images_path
  end

  # after_sign_out...メソッドによって、サインアウト後の遷移先を設定することが出来る。
  def after_sign_out_path_for(resource)
    about_path
  end

  # protectedは呼び出された他のコントローラからも参照することが出来る。
  protected

  # configure_...メソッドでは、devise_...メソッドを使うことでユーザー登録の際、ユーザー名のデータ操作を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end
end
