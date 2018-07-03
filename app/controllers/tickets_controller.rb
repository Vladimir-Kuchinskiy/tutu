class TicketsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create destroy]

  def index
    @tickets = current_user.tickets
  end

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

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path, notice: 'Ticket was successfully deleted.'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :begin_station_id, :end_station_id, :route_id, :client_name)
  end
end
