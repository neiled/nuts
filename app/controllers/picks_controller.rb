class PicksController < ApplicationController

  def new
    @talent = Talent.find(params[:talent_id])
    @breakdown = Breakdown.find(params[:breakdown_id])
    @pick = Pick.new(talent: @talent, breakdown: @breakdown)


    if @talent.photos.count == 0 then
      @pick.save
      redirect_to breakdown_path(@pick.breakdown, grid: params[:grid])
    end


  end

  def create
    @pick = Pick.new(pick_params)

    photos = params[:photos]  || []

    photos.each do |photo_id|
      @pick.photos << Photo.find(photo_id)
    end

    if(@pick.save)
      redirect_to breakdown_path(@pick.breakdown, grid: params[:grid])
    else
      redirect_to :back
    end

  end

  def update
    @pick = Pick.find(params[:id])
    @pick.update(update_state_params)
    redirect_to @pick.breakdown
  end

  def destroy
    #@talent = Talent.find(params[:talent_id])
    #@breakdown = Breakdown.find(params[:breakdown_id])

    #@talent.breakdowns.delete(@breakdown)
    #@talent.save!
    #
    @pick = Pick.find(params[:id])
    breakdown = @pick.breakdown
    @pick.destroy

    redirect_to breakdown
  end


  private

  def pick_params
    params.require(:pick).permit(:talent_id, :breakdown_id, :state)
  end

  def update_state_params
    params.permit(:workflow_state)
  end
end
