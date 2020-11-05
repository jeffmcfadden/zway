module Zway
  class Client
     
     def initialize
       @devices = []
       @devices_last_updated = 0
     end
     
     def update_devices(since = nil)
      since = @devices_last_updated if since.nil?
       
      api_base   ||= Zway.api_base
      session_id ||= Zway.session_id
       
      uri = URI( "#{api_base}/ZAutomation/api/v1/devices?since=#{since.to_i}")
      req = Net::HTTP::Get.new(uri)
      req['Cookie']="ZWAYSession=#{session_id}"
      res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req)
      end
      
      json = res.body
      
      devices_array = JSON.parse(json)["data"]["devices"]
      new_devices = devices_array.collect{ |d| Device.from_hash(d) }
      
      @devices = (new_devices + @devices)
      @devices.uniq!{ |d| d.id }
      
      @devices_last_updated = Time.now.to_i
      @devices
     end
     
     def devices
       @devices
     end
     
     def send_command(device, command, params = {})
      api_base   ||= Zway.api_base
      session_id ||= Zway.session_id
       
      url_string = "#{api_base}/ZAutomation/api/v1/devices/#{device.id}/command/#{command}"
      
      url_string += "?" + params.map{ |k,v| "#{k}=#{v}" }.join("&") if params.keys.size > 0
       
      uri = URI( url_string )
      req = Net::HTTP::Get.new(uri)
      req['Cookie']="ZWAYSession=#{session_id}"
      res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req)
      end
      
      data = JSON.parse res.body
      
      raise "Command Error" unless data["code"] == 200
     end
  end
end