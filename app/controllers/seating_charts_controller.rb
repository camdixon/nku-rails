class SeatingChartsController < ApplicationController
  def show
    @current_date = params[:date] || Date.today
    @students = Student.all
  end
end
