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
    @talent_grid = initialize_grid(Talent.where.not(id: chosen_talents), per_page: 10)

  end
  
  def index
    @outstanding_payments = Breakdown.joins(:picks).joins(:talents).where(picks: {workflow_state: 'Booked'}).distinct
    @breakdowns = Breakdown.all
  end

  private

  def breakdown_params
    params.require(:breakdown).permit(:name, :description)
  end
end
