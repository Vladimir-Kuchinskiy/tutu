# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create destroy]

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new(ticket_params)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    byebug
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully bought.'
    else
      render :new, locals: { params: params }
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
