class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show , :edit]
  before_action :set_prototype, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save 
      redirect_to root_path
    else
      render new_prototype_path
   end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    if  @prototype.user.id == current_user.id
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.save
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  private
  def move_to_index
    unless user_signed_in?  
      redirect_to action: index
    end
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
  

end
