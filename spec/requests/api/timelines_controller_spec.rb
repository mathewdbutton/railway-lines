require 'rails_helper'

RSpec.describe Api::TimelinesController, type: :request do

  let(:endpoint) { '/api/timelines'}
  describe 'GET #index' do
    it 'returns http success' do
      get endpoint
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:timeline) { create(:timeline, name:'new_timeline')}
    let(:resource_id) {timeline.id}
    it 'returns http success' do
      get "#{endpoint}/#{resource_id}"
      expect(response).to have_http_status(:success)
    end

    it 'returns a timeline' do
      get "#{endpoint}/#{resource_id}"
      expect(JSON.parse(response.body).symbolize_keys).to eq({name:new_timeline, events:[]})
    end
  end

end
