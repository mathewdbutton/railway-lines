# == Schema Information
#
# Table name: timelines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TimelineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :events, serializer: :event
  set_type :timeline
end
