require 'rails_helper'

RSpec.describe Api::EventsController, type: :request do

  let(:endpoint) { '/api/events'}
  describe 'GET #create' do
    it 'returns http success' do
      post endpoint
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #update' do
    let(:event_id) {'2'}
    context 'put' do
      it 'returns http success' do
        patch "#{endpoint}/#{event_id}"
        expect(response).to have_http_status(:success)
      end
    end

    context 'patch' do
      it 'returns http success' do
        patch "#{endpoint}/#{event_id}"
        expect(response).to have_http_status(:success)
      end
    end


  end

end
