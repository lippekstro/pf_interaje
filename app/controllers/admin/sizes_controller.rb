class Admin::SizesController < AdminController

	before_action :set_size, only: [:show, :edit, :update, :destroy]

	def index
		#@sizes = Size.all
		@q = Size.ransack(params[:q])
		@sizes = @q.result
	end

	def show
		
	end

	def new
		@size = Size.new		
	end

	def create
		@size = Size.new(size_params)

		if @size.save
			redirect_to admin_sizes_path, notice: "A pizza foi cadastrada com sucesso!"
		else
			render :new			
		end
	end

	def edit
		
	end

	def update
		if @size.update(size_params)
			redirect_to admin_sizes_path, notice: "A pizza foi atualizada com sucesso!"
		else
			render :edit
		end
	end

	def destroy
		@size.destroy
		redirect_to admin_sizes_path, notice: "A pizza foi excluida com sucesso!"		
	end

	private
	def set_size
		@size = Size.find(params[:id])		
	end

	def size_params
		params.require(:size).permit(:name, :slices_number)		
	end
end