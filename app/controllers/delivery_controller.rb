class DeliveryController < ApplicationController

	before_action :set_order, only: [:show, :edit, :update, :destroy]

	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)

		if @order.save
			redirect_to delivery_path, notice: 'O cliente foi cadastrado com sucesso!'
		else
			render :new
		end
		
	end

	def edit
		
	end

	def update
		if @order.update(order_params)
			redirect_to delivery_path, notice: 'O cliente foi atualizado com sucesso!'
		else
			render :edit
		end
		
	end

	def destroy
		@order.destroy
		redirect_to delivey_path, notice: 'O cliente foi excluido com sucesso!'
	end

	private
	def set_order
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:border)		
	end
	
end