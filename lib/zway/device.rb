module Zway

  class Device < ZwayObject
    @@attributes = [
      :id,
      :device_type,
      :update_time, 
      :metrics, 
      :creation_time,
      :creator_id,
      :has_history,
      :permanently_hidden,
      :probe_type,
      :visibility,
      :tags
    ]
  end

end