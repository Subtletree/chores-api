module Tomato

  # Gets locked ips and sends them calls send_tomato_request if any
  def update_router_locks
    locked_ips = []
    User.where(locked: true).each do |user|
      locked_ips << user.ip_range
    end
    if locked_ips.any?
      send_tomato_request(locked_ips)
    end
  end

  IP_PARAMS = '%3C1%3C100%3C1%3C100%3C2%3C0%3C0'
  SEPARATOR = '%3E'

  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  # Sends request to change router bandwidth limits
  def send_tomato_request(locked_ips)
    url = URI(ENV['TOMATO_ADDRESS'])
    Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') do |http|
      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'text/plain;charset=UTF-8'
      request["accept"] = '*/*'
      request["accept-encoding"] = 'gzip, deflate'
      request["accept-language"] = 'en-US,en;q=0.8'
      request["cache-control"] = 'no-cache'
      request.basic_auth ENV['TOMATO_USER'], ENV['TOMATO_KEY']

      request_body = "_ajax=1&_nextpage=/%23qos-qoslimit.asp&_nextwait=10&_service=qoslimit-restart&new_qoslimit_enable=1&new_qoslimit_rules="

      locked_ips.map! {|x| x + IP_PARAMS }
      request_body += locked_ips.join(SEPARATOR)

      request_body += '&qosl_enable=0&limit_br1_enable=0&limit_br2_enable=0&limit_br3_enable=0&qos_ibw=16000&qos_obw=700&_http_id=TID9fd0e8d9af21923b'
      request.body = request_body

      response = http.request(request)
      puts response.read_body
    end
  end
end
