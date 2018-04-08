RSpec.describe Api::EventsController, type: :request do

  let(:endpoint) { '/api/events'}
  let(:params) { { title:       'event_title',
                   caption:     'event_caption',
                   description: 'event_description',
                   event_date:  DateTime.current } }
  describe 'POST #create' do
    it 'returns http created' do
      post endpoint, params: params
      expect(response).to have_http_status(:created)
    end

    it 'creates an event' do
      expect do
        post endpoint, params: params
      end.to change { Event.count }.by(1)
    end

    it 'returns a location header' do
      post endpoint, params: params
      expect(response.location).to_not be_nil
    end
  end

  describe '#update' do
    let(:resource_id) { '2' }
    context 'PUT' do
      it 'returns http success' do
        patch "#{endpoint}/#{resource_id}"
        expect(response).to have_http_status(:success)
      end
    end

    context 'PATCH' do
      it 'returns http success' do
        patch "#{endpoint}/#{resource_id}"
        expect(response).to have_http_status(:success)
      end
    end
  end

end
