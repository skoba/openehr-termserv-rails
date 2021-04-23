class CodesController < ApplicationController
  def index
    if code_params.empty?
      @codes = Code.all
    else
      @codes = Code.where(value: code_params[:code]).or(Code.where(description: code_params[:description]))
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
