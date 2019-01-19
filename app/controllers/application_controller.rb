class ApplicationController < ActionController::Base

  def test
    render plain: "Hello, world!"
  end

end
