class Api::TestgetController < Api::BaseController
  before_action :authenticate_user!, only: [:index]

  def index
    render plain: "Hello World!"
  end
end
