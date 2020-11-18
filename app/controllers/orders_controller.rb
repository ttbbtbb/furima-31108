class OrdersController < ApplicationController
  def new
    # @model = Model.new
  end

  def create
    @model = Model.new(model_params)
    if @model.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def model_params
    params.require(:model).permit(:column).merge(user_id: current_user.id)
  end
end
