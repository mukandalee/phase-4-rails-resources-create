class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end
  #IF writing a fetch could be like 
#   fetch("http://localhost:3000/birds", {
#   method: "POST",
#   headers: {
#     "Content-Type": "application/json",
#   },
#   body: JSON.stringify({
#     name: "Monk Parakeet",
#     species: "Myiopsitta monachus",
#   }),
# });
def create
  bird = Bird.create(name: params[:name], species: params[:species])
  render json: bird, status: :created
end



end