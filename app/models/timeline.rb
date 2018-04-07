# == Schema Information
#
# Table name: timelines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Timeline < ApplicationRecord
  has_many :events
end
