class Api::Feed::TechnologiesController < ApplicationController
  def technologies
    @technologies = Technology.where(approved: true).map(&:index).sort_by { |technology| technology[:name] }
    render json: @technologies, status: :ok
  end
end
