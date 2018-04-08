# == Schema Information
#
# Table name: timelines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Timeline, type: :model do

  context 'associations' do
    it {should have_many(:events)}
  end

  context 'factory' do
    it 'has a valid base factory' do
      create(:timeline)
    end

    it 'has created association factory' do
      timeline = create(:timeline, :with_created_events)
      expect(timeline.events.length > 0).to be_truthy
      expect(timeline.events[0].new_record?).to be_falsey
    end

    it 'can generate n events' do
      timeline = create(:timeline, :with_created_events, event_count:15)
      expect(timeline.events.length).to eq(15)
    end
  end

end
