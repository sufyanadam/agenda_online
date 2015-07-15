describe User do
  describe '#has_password?' do
    let(:user) { User.create!(email: 'mario@pipes.com', password: 'password', salt: 'salt') }
    let(:password) { 'some_password' }
    subject { user.has_password?(password) }

    context 'when the password matches' do
      let(:password) { 'password' }

      it { should be_truthy }
    end

    context 'when the password does not match' do
      let(:password) { 'wrong_password' }

      it { should be_falsey }
    end
  end
end
