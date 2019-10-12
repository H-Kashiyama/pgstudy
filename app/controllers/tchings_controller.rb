class TchingsController < ApplicationController
 
  def index
    @ctg = Ctg.find(params[:ctg_id])
    @tchings = @ctg.tchings.order(id: :asc).page(params[:page]).per(10)
    # @tchings = Tching.where(ctg_id: params[:ctg_id]).page(params[:page])
   
  end

  def search
    
    @keyw = params[:q]
    @tchings =Tching.where("content like '%" + @keyw + "%'").page(params[:page])
    
    render :serch
   
  end
  
  def show
    @tching = Tching.find(params[:id])
    @ctg_id = @tching.ctg_id
   
  end
  
  def new
     #@tching = Tching.new
     #@ctg = Ctg.find_by(params[:id])
     #@ctg = Ctg.where(ctg_id: params[:ctg_id])
     @tching = Tching.new(ctg_id: params[:ctg_id])
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
