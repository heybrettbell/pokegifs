class PokemonController < ApplicationController
  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    # byebug
    body = JSON.parse(res.body)
    name  = body["name"]
    id = body["id"]
    types = body["types"]
    result = []
    types.each do |type|
      diff_types = type["type"]["name"]
      result << diff_types
    end

    render json: {
      "id": id,
      "name": name,
      "types": result
    }

  end
end
