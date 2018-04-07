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

require 'rails_helper'

RSpec.describe Event, type: :model do

  context 'associations' do
    it {should belong_to(:timeline)}
  end

end
