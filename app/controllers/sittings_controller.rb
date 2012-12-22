class SittingsController < ApplicationController

  def create
    Sitting.create(params[:sitting])
    redirect_to root_url
  end

  def destroy
    sitting = Sitting.find(params[:id])
    sitting.destroy if sitting
    redirect_to root_url
  end
end
