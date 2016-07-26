class ConceptsController < ApplicationController
  def show
  end

  def index
    @terminologies = Terminology.all
  end
end
