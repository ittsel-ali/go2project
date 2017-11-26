class TradesController < ApplicationController
  
  def index
  	@trade_cats = current_user.trade_categories || []
  	@trade = Trade.new
  end

  def create
  	@trade = current_user.trades.build(permit_trade_attributes)

    if @trade.save
      flash[:success] = I18n.t 'resource_creation', resource: @trade.class.table_name.singularize.titleize
    else
      flash[:error] = @trade.errors.full_messages.to_sentence
    end
    
    redirect_to trades_path
  end


  protected

  def permit_trade_attributes
  	params.require(:trade).permit(:business_name, 
  		:person_name, :email, :cell, :office_phone, :fax, :address, :trade_category_id)
  end
end
