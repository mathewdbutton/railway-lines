RSpec.describe Api::CreateUserRequest do

  context '.create' do
    let(:params) {{name: 'name',
                   email: 'email',
                   password: 'password'}}
    it 'creates an event' do
      expect do
        described_class.new(params).create
      end.to change {User.count}.by(1)
    end

    it 'returns that event' do
      user = described_class.new(params).create
      expect(user.name).to eq('name')
      expect(user.email).to eq('email')
      expect(user.password).to eq('password')

    end

  end

end