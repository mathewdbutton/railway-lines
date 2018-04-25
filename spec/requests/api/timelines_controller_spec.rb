require 'rails_helper'

RSpec.describe Api::TimelinesController, type: :request do

  let(:endpoint) {'/api/timelines'}
  let(:user) {create(:user)}
  let(:headers) {{Authorization: login_user(user)}}
  describe 'GET #index' do
    it 'returns http success' do
      get endpoint, headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:timeline) {create(:timeline, :with_created_events, name: 'new_timeline')}
    let(:resource_id) {timeline.id}
    it 'returns http success' do
      get "#{endpoint}/#{resource_id}", headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'returns a timeline' do
      get "#{endpoint}/#{resource_id}", headers: headers
      expect(JSON.parse(response.body).dig('data', 'attributes')).to eq({name: 'new_timeline'}.stringify_keys)
    end

    it 'returns a timeline with events' do
      get "#{endpoint}/#{resource_id}", headers: headers
      event_data = JSON.parse(response.body).dig('data', 'relationships', 'events', 'data')
      expect(event_data).to_not eq([])
      expect(event_data.length).to_not eq(0)
    end
  end

end
