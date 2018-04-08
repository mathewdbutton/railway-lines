class TimelineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :events, serializer: :event
  set_type :timeline
end