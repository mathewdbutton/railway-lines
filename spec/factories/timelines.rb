# == Schema Information
#
# Table name: timelines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :timeline, class: 'Timeline' do
    name SecureRandom.hex(6)

    transient do
      event_count 5
    end

    trait :with_created_events do
      after(:create) do |timeline, evaluator|
        create_list(:events, evaluator.event_count, timeline: timeline)
      end
    end
  end

end
