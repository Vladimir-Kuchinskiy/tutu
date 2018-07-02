# frozen_string_literal: true

class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @ticket = @user.tickets.new(ticket_params)
    redirect_to @ticket if @ticket.save
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :begin_station_id, :end_station_id, :route_id)
  end

  def user_params
    params.require(:ticket).permit(:name)
  end
end
