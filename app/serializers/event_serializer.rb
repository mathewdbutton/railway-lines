class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes *%i(title caption description event_date)
  belongs_to :timeline
  set_type :event
end