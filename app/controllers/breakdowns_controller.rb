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
    chosen_talents = @breakdown.talents.map(&:id)

    @talents = Talent.where.not(id: chosen_talents)

    @chosen = @breakdown.picks
  end

  private

  def breakdown_params
    params.require(:breakdown).permit(:name, :description)
  end
end
