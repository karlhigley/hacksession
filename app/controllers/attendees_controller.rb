class AttendeesController < ApplicationController
  def index
    @attendees = Attendee.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @attendees }
    end
  end

  def show
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      format.json { render json: @attendee }
    end
  end

  def create
    @attendee = Attendee.create(params[:attendee])

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { @attendee.new_record? ? render_error_json : render_attendee_json }
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy if @attendee
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { render json: nil, status: :ok }
    end
  end

  protected

  def render_attendee_json
    render json: @attendee, status: :created, location: @attendee
  end

  def render_error_json
    render json: @attendee.errors, status: :unprocessable_entity
  end

end
