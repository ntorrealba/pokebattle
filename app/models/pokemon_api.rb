class PokemonApi
  attr_accessor :name, :url, :move
  attr_reader :id, :types, :color, :image

  URL = 'https://pokeapi.co/api/v2/pokemon?limit=12&offset=0'

  def self.all
    response = RestClient.get(URL, { accept: 'application/json' })
    pokemons = JSON.parse(response.body)['results'].map do |pokemon|
      pokemon_api = PokemonApi.new(name: pokemon["name"], url: pokemon["url"])
    end
    pokemons
  end

  def self.find(id)
    url = "https://pokeapi.co/api/v2/pokemon/#{id}"
    response = RestClient.get(url, { accept: 'application/json' })
    pokemon_parsed = JSON.parse(response.body)
    # binding.pry
    pokemon = PokemonApi.new(url: url, name: pokemon_parsed["name"])
  end

  def initialize(name: "", url:, move:"")
    @name = name
    @url = url
    @move = move
    get_info
  end


  private

  def get_info
    info = RestClient.get(@url, { accept: 'application/json' })
    info_parsed = JSON.parse(info.body)
    @id = info_parsed['id']
    @types = info_parsed['types'].map{|type| type["type"]["name"] }
    @color = @types.first.downcase
    #@image_battle = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{@id}.png"
    #@image_battle_back="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/#{@id}.png"
    @image = "https://pokeres.bastionbot.org/images/pokemon/#{@id}.png"
  end
end
