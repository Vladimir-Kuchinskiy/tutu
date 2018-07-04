# frozen_string_literal: true

class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def edit; end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Ticket was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :begin_station_id, :end_station_id, :route_id, :client_name)
  end
end
