class PrototypesController < ApplicationController
 
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show]


def edit
@prototype = Prototype.find(params[:id])

end

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
  redirect_to root_path
end



def update 
  @prototype = Prototype.find(params[:id])
if  @prototype.update(protospace_params)
  redirect_to edit
else
  render :edit
end
end



def show
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments
end


def index
@prototypes = Prototype.all
end

def new
  @prototype = Prototype.new
end

def create
  @prototype = Prototype.new(protospace_params)
  if @prototype.save
    redirect_to root_path
  else
    render :new
  end

end

private 
def protospace_params
  params.require(:prototype).permit(:title, :image, :catch_copy, :concept).merge(user_id: current_user.id)

end

def move_to_index
  if user_signed_in?
    redirect_to action: :index
  end
end

end