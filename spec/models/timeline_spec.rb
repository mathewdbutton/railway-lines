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

end
