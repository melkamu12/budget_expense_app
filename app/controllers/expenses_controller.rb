class ExpensesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order(created_at: :desc)
    @total = @expenses.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @categories = Category.all

    if @categories.empty?
      redirect_to root_path, alert: 'No categories available'
      return
    end

    @expense = @category.expenses.build(expense_params)

    if @expense.save
      redirect_to category_expenses_path(category_id: @category.id), notice: 'Expense was successfully created.'
    else
      flash.now[:alert] = 'Expense cannot be created.'
      render :new
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @categories = @expense.categories # Get the categories associated with the expense

    @categories.each do |category|
      expense_category = category.expense_categories.find_by(expense_id: @expense.id)
      expense_category&.destroy # Destroy the expense_category if it exists
    end

    @expense.destroy
    redirect_to category_expenses_path(category_id: params[:category_id]), alert: 'Expense deleted successfully.'
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, category_ids: []).merge(author_id: current_user.id)
  end
end
