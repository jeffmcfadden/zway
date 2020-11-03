module Zway
  class Client
     
     def initialize
     end
     
     def devices(since = 0)
       api_base   ||= Zway.api_base
       session_id ||= Zway.session_id
       
       uri = URI( "#{api_base}/ZAutomation/api/v1/devices")
      req = Net::HTTP::Get.new(uri)
      req['Cookie']="ZWAYSession=#{session_id}"
      res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req)
      end
      
      res.body
      
      JSON.parse(res.body)
     end
     
  end
end