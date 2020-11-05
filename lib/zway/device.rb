require "ostruct"

module Zway

  class Device < ZwayObject
    @@attributes = [
      :id,
      :device_type,
      :update_time, 
      :creation_time,
      :creator_id,
      :has_history,
      :permanently_hidden,
      :probe_type,
      :visibility,
      :tags
    ]
    
    @@additional_attributes = [:metrics]
    
    def initialize
      super
      @metrics = []
    end
    
    def ==(other)
      eql? other
    end
      
    def eql?(other)
      self.id  == other.id &&
      !(self.id.nil?) &&
      !(other.id.nil?)
    end
    
    def metrics=(new_metrics)
      @metrics = OpenStruct.new(new_metrics)
    end
    
    def metrics
      return @metrics
    end
    
  end

end