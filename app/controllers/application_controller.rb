class ApplicationController < ActionController::API

  # Return Unauthorized for Ip's not on the whitelist
  def ip_whitelist
    whitelist = ['203.97.99.8']
  #  if Rails.env.production? && whitelist.exclude?(request.remote_ip)
    if whitelist.exclude?(request.remote_ip)
      render status: 401
    end
  end
end
