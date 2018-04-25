describe Api::AuthenticationController, type: :request do

  let(:user) { create(:user, password:'test')}
  describe '#authenticate' do
    context 'valid user' do
      it 'returns a 200' do
        post '/api/authenticate', params: {email:user.email, password:'test'}
        expect(response.status).to eq(200)
      end

      it 'returns auth token in response' do
        post '/api/authenticate', params: {email:user.email, password:'test'}
      end
    end

    context 'invalid user' do
      it 'returns a 401' do
        post '/api/authenticate', params: {email:user.email, password:'red'}
        expect(response.status).to eq(401)
      end
    end
  end

end
