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

FactoryBot.define do
  factory :events, class: 'Event' do
    title SecureRandom.hex(8)
    description SecureRandom.hex(8)
    caption SecureRandom.hex(8)
    event_date DateTime.current

    trait :with_built_timeline do
      after(:create) do |event|
        build(:timeline,events:[event])
      end
    end
    trait :with_created_timeline do
      timeline
    end

  end
end
