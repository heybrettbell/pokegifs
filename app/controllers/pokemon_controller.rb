class PokemonController < ApplicationController
  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")

    body = JSON.parse(res.body)
    name  = body["name"]
    id = body["id"]
    types = body["types"]
    result = []
      types.each do |type|
        diff_types = type["type"]["name"]
        result << diff_types
      end

    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{name}&rating=g")
    body = JSON.parse(res.body)
    # byebug
    url = body["data"][0]["url"]

    render json: {
      "id": id,
      "name": name,
      "types": result,
      "url": url
    }

  end


end
