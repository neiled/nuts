class TalentsController < ApplicationController
  def index
    @talents = Talent.all
  end

  def edit
    @talent = Talent.find(params[:id])
  end

  def update
    @talent = Talent.find(params[:id])
    if @talent.update(talent_params)
      redirect_to talent_url, notice: 'Talent was updated'
    else
      render action: 'edit'
    end
  end

  def show
    @talent = Talent.find(params[:id])
  end

  def new
    @talent = Talent.new
  end

  def create
    @talent = Talent.new(talent_params)
    if @talent.save
      flash[:success] = 'Talent created'
      redirect_to @talent
    else
      render 'new'
    end
  end

  private

  def talent_params
    params.require(:talent).permit(:last_name, :first_name, :middle_name, :date_of_birth, :permit_expires)
  end
end
