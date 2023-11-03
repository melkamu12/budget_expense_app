class CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = current_user.categories.includes(:expenses)
    end

    def new
        @category = Category.new
        @icon_options = Category::ICON_OPTIONS
    end
    
    def edit
        @category = Category.find(params[:id])
        @icon_options = Category::ICON_OPTIONS
    end
    
    def update
        @category = Category.find(params[:id])

        if @category.update(category_params)
            flash[:notice] = "Expense category successfully Updated."
            redirect_to categories_path
        else
            flash.now[:alert] = 'Category cannot be updated.'
            render :edit
        end
    end

    def destroy
        @category = current_user.categories.find(params[:id])
        @category.destroy
        redirect_to categories_path, alert: 'Expense category deleted successfully.'
    end

    def create
        @user = current_user
        @category = @user.categories.build(user_id:@user.id, **category_params)
        if @category.save
            redirect_to categories_path, notice: 'New expense category successfully created.'
        else 
            redirect_to categories_path, alert: 'Cannot create a new expense category'
        end
    end

    private
    
    def category_params
        params.require(:category).permit(:name, :icon)
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end
end
