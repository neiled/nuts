class BreakdownsController < ApplicationController
  def new
    @breakdown = Breakdown.new
  end

  def create
    @breakdown = Breakdown.new(breakdown_params)
    if @breakdown.save
      flash[:success] = 'Breakdown created'
      redirect_to @breakdown
    else
      render 'new'
    end
  end

  def show
    @breakdown = Breakdown.find(params[:id])
    @talents = Talent.all
    @chosen = @breakdown.talents
  end

  private

  def breakdown_params
    params.require(:breakdown).permit(:name, :description)
  end
end
