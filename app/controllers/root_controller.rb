class RootController < ApplicationController
  def landing
    @logo_path = Rails.root.join('app', 'assets', 'images', 'nathan-logo.png')
  end
end
