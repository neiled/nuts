class PicksController < ApplicationController
  
  def new
    @talent = Talent.find(params[:talent_id])
    @breakdown = Breakdown.find(params[:breakdown_id])

  end

  def create
    @talent = Talent.find(params[:talent_id])
    @breakdown = Breakdown.find(params[:breakdown_id])

    @talent.breakdowns << @breakdown
    @talent.save!

    redirect_to @breakdown

  end

  def destroy
    @talent = Talent.find(params[:talent_id])
    @breakdown = Breakdown.find(params[:breakdown_id])

    @talent.breakdowns.delete(@breakdown)
    @talent.save!

    redirect_to @breakdown
  end
end
