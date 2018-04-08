RSpec.describe Api::ShowTimelineResponse do

  context '.show' do
    let!(:timeline) { create(:timeline, name:'new_timeline') }
    let(:timeline2) { create(:timeline, name:'new_timeline') }
    let(:params) { { id: timeline.id} }

    it 'returns that timeline' do
      returned_timeline = described_class.new(params).show
      expect(returned_timeline).to eq(timeline)
    end

  end

end