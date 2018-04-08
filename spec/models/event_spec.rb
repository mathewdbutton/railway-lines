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

  context 'factory' do
    it 'has a valid base factory' do
      create(:events)
    end

    it 'has built association factory' do
      event = nil
      expect do
         event = create(:events, :with_built_timeline)
      end.to_not change{Timeline.count}
      expect(event.timeline.new_record?).to be_truthy
    end

    it 'has created association factory' do
      event = nil
      expect do
        event = create(:events, :with_created_timeline)
      end.to change{Timeline.count}.to(1)
      expect(event.timeline.new_record?).to be_falsey
    end
  end

end
