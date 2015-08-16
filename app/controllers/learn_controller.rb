class LearnController < ApplicationController
  def index
    @card = Card.where(panel_id: params[:panel_id]).first
  end

  def show
    @card = Card.find(params[:id])
    @card_next = Card.find_by(id: params[:id].next)
  end
end
