module Zway 
  
  class ZwayObject
    @@attributes = []
    
    def initialize
      @@attributes.each do |attr|
        self.class.send(:define_method, "#{attr}=".to_sym) do |value|
          instance_variable_set("@" + attr.to_s, value)
        end
  
        self.class.send(:define_method, attr.to_sym) do
          instance_variable_get("@" + attr.to_s)
        end
      end
    end
    
    def self.attributes
      @@attributes
    end
    
    def self.from_json(json)
      h = JSON.parse json
      
      return self.from_hash h
    end
    
    def self.from_hash(h)
      o = self.new
      
      h.keys.each do |k|    
        if self.attributes.include? k.to_sym
           o.send("#{k}=".to_sym, h[k])
        end
      end
      
      o
    end
  end
end