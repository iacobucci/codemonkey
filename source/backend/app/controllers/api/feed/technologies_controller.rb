class Api::Feed::TechnologiesController < ApplicationController
  def technologies
    @technologies = Technology.where(approved: true).map(&:index)
    render json: @technologies, status: :ok
  end
end
