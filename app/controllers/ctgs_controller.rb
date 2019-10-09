class CtgsController < ApplicationController
  before_action :require_user_logged_in

 
  
  def index
    @ctgs = Ctg.order(id: :asc).page(params[:page]).per(20)
  
  end
 
  def new
     @ctg = Ctg.new
  end

  def create
    @ctg = Ctg.new(ctgs_params)
    if @ctg.save
      flash[:success] = 'カテゴリーが追加されました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'カテゴリーが追加されませんでした'
      render :new
    end
  end
  
  def edit
      @ctg = Ctg.find(params[:id]) 
  end

  def update
    @ctg = Ctg.find(params[:id]) 
    if @ctg.update(ctgs_params)
      flash[:success] = 'カテゴリーは正常に更新されました'
      redirect_to root_path
    else
      flash.now[:danger] = 'カテゴリーは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @ctg = Ctg.find(params[:id]) 
    @ctg.destroy

    flash[:success] = 'カテゴリーは正常に削除されました'
    redirect_to ctgs_url
 
  end
  
  private
  
  def ctgs_params
    params.require(:ctg).permit(:ctg)
     
  end
  
 

 

end
