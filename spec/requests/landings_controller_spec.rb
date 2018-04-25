RSpec.describe LandingsController, type: :request do

  describe 'GET #index' do

    let(:user) {create(:user)}
    let(:headers) {{Authorization: login_user(user)}}
    it 'returns http success' do
      get '/' , headers:headers
      expect(response).to have_http_status(:success)
    end
  end

end
