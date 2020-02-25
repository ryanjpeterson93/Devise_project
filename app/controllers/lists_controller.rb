class ListsController < ApplicationController
before_action :set_list, only: [:show, :edit, :update]

  def index
    @lists = current_user.lists
  end

  def show

  end

  def new

  end

  def edit
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    else
      rednder :new
    end
  end

  def Destroy
    @list.destroy
    redirect_to lists_path
  end


  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :body)
  end

end
