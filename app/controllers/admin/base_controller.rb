class Admin::BaseController < ApplicationController
  before_filter :authenticate!

  layout 'admin'

  protected

  def authenticate!
    authenticate_or_request_with_http_basic do |username, password|
      username == APP_CONFIG[:admin_login] && password == APP_CONFIG[:admin_password]
    end
  end
end
