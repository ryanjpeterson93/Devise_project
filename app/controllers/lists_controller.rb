class ListsController < ApplicationController
before_action :set_list, only: [:show, :edit, :update]

  def index
    @lists = current_user.lists
  end

  def show

  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      flash[:success] = "List Created"
      redirect_to lists_path
    else
      flash[:error] = "Error #{@list.errors.full_messages.join('\n')}"
      render :new
    end
  end

  def edit 

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
