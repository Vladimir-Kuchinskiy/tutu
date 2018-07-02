class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :begin_station_id, :end_station_id, :route_id, :client_name)
  end
end
