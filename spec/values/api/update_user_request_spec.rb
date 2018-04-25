RSpec.describe Api::UpdateUserRequest do

  context '#update' do

    let(:user) {create(:user, name: 'steve', email: 'email@email.com')}
    context 'valid parameters' do
      let(:params) {{name: 'name',
                     email: 'email'}}
      it 'creates an event' do
        described_class.new(params, user).update
        user.reload
        expect(user.name).to eq('name')
        expect(user.email).to eq('email')
      end
    end

    context 'invalid parameter' do
      let(:params) {ActionController::Parameters.new(name: 'fred', junk:'junk')}
      it 'only updates valid parameters' do
        described_class.new(params, user).update
        user.reload
        expect(user.name).to eq('name')
      end
    end
  end
end