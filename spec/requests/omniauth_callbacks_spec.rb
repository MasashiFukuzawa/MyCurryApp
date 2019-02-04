require 'rails_helper'

describe "OmniauthCallbacks" do
  describe 'with twitter oauth' do
    context "valid oauth signin" do
      let(:oauth_user) {set_omniauth(:twitter)}

      before do
        login_with_omniauth(oauth_user.provider)
      end
      
      let(:user) {User.where(:provider => oauth_user.provider, :uid => oauth_user.uid).first}

      # visitメソッドなんてないよと怒られるので保留
      
      # specify {expect(user).not_to eq nil}
      # specify {expect(user.provider).to eq oauth_user.provider}
      # specify {expect(user.uid).to eq oauth_user.uid}
      # specify {expect(user.name).to eq oauth_user.extra.raw_info.name}
      # specify {expect(user.email).to eq oauth_user.info.email}
      # specify {expect(user.password).to eq oauth_user.info.password}
      # specify {expect(user.twitter_image).to eq oauth_user.info.twitter_image}
      # specify {expect(user.location).to eq oauth_user.info.location}
      # specify {expect(user.description).to eq oauth_user.info.description}
    end
  end
end
