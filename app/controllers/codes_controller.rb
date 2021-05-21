class CodesController < ApplicationController
  def index
    if code_params.empty?
      @codes = Code.all
    elsif code_params[:code]
      @codes = Code.where(value: code_params[:code])
    elsif code_params[:description]
      Code.where(description: code_params[:description])
    end
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
  end

  private
  def code_params
    params.permit(:code, :description, :issuer, :terminology_id)
  end
end
