module Zway
  
  class ZwayConfiguration
    attr_accessor :session_id
    attr_accessor :api_base
    
    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end
    
    def initialize
      @session_id = nil
      @api_base = nil
    end
  end

end