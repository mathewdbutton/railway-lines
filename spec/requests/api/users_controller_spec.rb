require 'rails_helper'

RSpec.describe Api::UsersController, type: :request do

  let(:endpoint) {'/api/users'}
  let(:params) {{name: 'fred',
                 email: 'fred@fred.com',
                 password: 'fred'}}

  describe 'POST #create' do
    context 'valid user params' do
      it 'responds with a 201' do
        post endpoint, params: params
        expect(response).to have_http_status(:created)
      end

      it 'sets the location header' do
        post endpoint, params: params
        user = User.last
        expect(response.location).to eq("/api/users/#{user.id}")
      end

      it 'creates a user' do
        expect do
          post endpoint, params: params
        end.to change {User.count}.by(1)
      end
    end
  end

  describe 'PATCH #update' do

    let(:params) {{name: 'fred'}}
    let(:user) {create(:user)}
    let(:headers) {{Authorization: login_user(user)}}
    context 'valid request' do
      it 'responds with 204' do
        patch "#{endpoint}/#{user.id}", params: params, headers:headers
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'unauthorised request' do
      it 'responds with unauthorised' do
        patch "#{endpoint}/#{user.id}", params: params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
