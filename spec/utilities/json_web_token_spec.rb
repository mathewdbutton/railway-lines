describe JsonWebToken do
  let(:secret) {Rails.application.secrets.secret_key_base}
  describe '#encode' do
    it 'uses JWT to encode' do
      expect(JWT).to receive(:encode)
                         .with({exp: 12.hours.from_now.to_i},
                               secret)
      JsonWebToken.encode({}, 12.hours.from_now)
    end
  end

  describe '#decode' do
    it 'uses JWT to decode' do
      expect(JWT).to receive(:decode).with('junk', secret)
      JsonWebToken.decode('junk')
    end
  end
end
