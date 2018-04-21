# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  caption     :string
#  event_date  :datetime
#  timeline_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes *%i(title caption description event_date)
  belongs_to :timeline
  set_type :event
end
