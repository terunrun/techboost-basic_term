class ApplicationController < ActionController::Base
  # unit19 CSRF対策
  protect_from_forgery with: :exception

  # unit19 flashメッセージのタイプを追記
  add_flash_types :success, :info, :warning, :danger
end
