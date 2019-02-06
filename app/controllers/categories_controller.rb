class CategoriesController < ApplicationController
  def index
    # render json: Category.all, include: ['products']
    render json: Category.all.includes(:products), include: ['products']
  end

  def show
    render json: Category.find(params[:id])
  end
end
