class Api::AppNamesController < ApplicationController
  def getappname
    render json: { name: 'codemonkey' }
  end
end
