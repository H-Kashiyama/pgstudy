class TchingsController < ApplicationController
    
  def index
    @tchings = Tching.where(ctg_id: params[:ctg_id]).page(params[:page])
    #@tchings = Tching.find_by(params[:ctg_id])
  end

  def show
    @tching = Tching.find(params[:id])
  end
 
  def new
     @tching=Tching.new
    
  end

  
  def create
    @tching = Tching.new(tching_params)
    if @tching.save
      flash[:success] = '正常に投稿されました'
      redirect_to @tching
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end
  
  def edit
    
      @tching = Tching.find(params[:id]) 
      
  end

  def update
   @tching = Tching.find(params[:id]) 
    if @tching.update(tching_params)
      flash[:success] = '内容は正常に更新されました'
      redirect_to @tching
    else
      flash.now[:danger] = '内容は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tching = Tching.find(params[:id]) 
    @tching.destroy

    flash[:success] = '内容は正常に削除されました'
    redirect_to root_url
 
  end
  
  private
  
  def tching_params
    params.require(:tching).permit(:content, :title, :ctg_id)
  end
  
end