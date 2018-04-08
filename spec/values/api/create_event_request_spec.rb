RSpec.describe Api::CreateEventRequest do

  context '.create' do
    let(:time) { DateTime.current }
    let(:params) { { title:       'event_title',
                     caption:     'event_caption',
                     description: 'event_description',
                     event_date:  time } }
    it 'creates an event' do
      puts described_class
      expect do
        described_class.new(params).create
      end.to change { Event.count }.by(1)
    end

    it 'returns that event' do
      event = described_class.new(params).create
      expect(event.title).to eq('event_title')
      expect(event.caption).to eq('event_caption')
      expect(event.description).to eq('event_description')
      expect(event.event_date).to eq(time)
    end

  end

end