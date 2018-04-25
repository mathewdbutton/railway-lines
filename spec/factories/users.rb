FactoryBot.define do
  factory :user do
    name SecureRandom.hex(8)
    email SecureRandom.hex(8)
    password SecureRandom.hex(8)
  end
end
