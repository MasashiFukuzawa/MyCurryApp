include Warden::Test::Helpers

module RequestHelpers
  def login(user)
    login_as user, scope: :user
  end

  def set_omniauth(service = :twitter)
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[service] = OmniAuth::AuthHash.new({
      provider:     service.to_s,
      uid:          '1234',
      name:         '認証テスト君',
      email:        'twitter@example.com',
      password:     '1111',
      twitter_image: nil,
      location:     '日本',
      description:  'テストサンプルです'})

    OmniAuth.config.mock_auth[service]
  end

  def login_with_omniauth(service = :twitter)
    visit "/users/auth/#{service.to_s}"
  end
end