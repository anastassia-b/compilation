class Api::PartiesController < ApplicationController
  def index
    @parties = Party.includes(guests: [:gifts])
    render :index
  end

  def show
    @party = Party.includes(guests: [:gifts]).find(params[:id])
    render :show
  end
end
