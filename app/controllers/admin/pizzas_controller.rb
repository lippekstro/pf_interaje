class Admin::PizzasController < AdminController
	
	before_action :set_pizza, only: [:show, :edit, :update, :destroy]

	def index
		#@pizzas = Pizza.order('name').page(params[:page])
		@q = Pizza.ransack(params[:q])
		@pizzas = @q.result
	end

	def show
		
	end

	def new
		@pizza = Pizza.new		
	end

	def create
		@pizza = Pizza.new(pizza_params)

		if @pizza.save
			redirect_to admin_pizzas_path, notice: "A pizza foi cadastrada com sucesso!"
		else
			render :new			
		end
	end

	def edit
		
	end

	def update
		if @pizza.update(pizza_params)
			redirect_to admin_pizzas_path, notice: "A pizza foi atualizada com sucesso!"
		else
			render :edit
		end
	end

	def destroy
		@pizza.destroy
		redirect_to admin_pizzas_path, notice: "A pizza foi excluida com sucesso!"		
	end

	private
	def set_pizza
		@pizza = Pizza.find(params[:id])		
	end

	def pizza_params
		params.require(:pizza).permit(:name, :description, :price, :image)		
	end
end