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
      
      json = res.body
      
      devices_array = JSON.parse(json)["data"]["devices"]
      
      devices = devices_array.collect{ |d| Device.from_hash(d) }
     end
  end
end