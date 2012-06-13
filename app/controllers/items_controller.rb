class ItemsController < ApplicationController
	before_filter :authenticate_user!, except:[:show, :index]

def new
	@item = Item.new
end

def show
	@item = Item.find(params[:id])
end

def create
	@item = current_user.items.build(params[:item])
	if @item.save
		flash[:success] = "Your item has been saved"
		redirect_to root_path
	else
		render 'static_pages/item_error'
		end
	end

	def destroy
		@item.destroy
		redirect_back_or root_path
	end

end
