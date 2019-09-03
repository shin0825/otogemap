class ApplicationController < ActionController::Base
  include AjaxErrorRenderer
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :allow_googlemap_iframe

  GOOGLE_MAP_URL = "https://maps.google.co.jp/maps"

  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/"
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def allow_googlemap_iframe
    response.headers['X-Frame-Options'] = "ALLOW-FROM #{GOOGLE_MAP_URL}"
    response.headers['Content-Security-Policy'] = "frame-ancestors #{GOOGLE_MAP_URL}"
  end
end
