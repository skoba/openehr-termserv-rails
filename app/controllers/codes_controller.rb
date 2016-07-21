class CodesController < ApplicationController
  def index
    @codesets = Codeset.all
  end

  def show
  end
end
