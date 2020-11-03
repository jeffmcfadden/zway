require "json"
require "logger"
require "net/http"
require "forwardable"

require "zway/zway_object"
require "zway/client"
require "zway/device"
require "zway/version"
require "zway/zway_configuration"

unless String.new.respond_to?(:underscore)
  require 'string_helpers/underscore'
end

module Zway
  
  @configuration = Zway::ZwayConfiguration.setup

  class << self
    extend Forwardable
    
    def_delegators :@configuration, :session_id, :session_id=
    def_delegators :@configuration, :api_base,   :api_base=
  end
  
  

  class Error < StandardError; end
  # Your code goes here...
end
