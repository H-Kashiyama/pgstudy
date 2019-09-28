class ApplicationController < ActionController::Base
    private
   def counts
    @tchings = Tching.where(ctg_id: params[:ctg_id]).page(params[:page])
    @count_tchings = @tchings.count
   end
end
