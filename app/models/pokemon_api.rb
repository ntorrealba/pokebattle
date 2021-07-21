class PokemonApi
  attr_accessor :name, :url, :move, :height, :weight, :abilities
  attr_reader :id, :types, :color, :image, :moves, :base_states, :base_states_number
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
    pokemon = PokemonApi.new(url: url, name: pokemon_parsed["name"], height: pokemon_parsed["height"], weight: pokemon_parsed["weight"], abilities: pokemon_parsed["abilities"].map{|ability| ability["ability"]["name"] })
  end

  def initialize(name: "", url:, move:"", height:"", weight:"", abilities:"")
    @name = name
    @url = url
    @move = move
    @height = height
    @weight = weight
    @abilities = abilities
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
    @moves = info_parsed['moves'].map{ |move| [move["move"]["name"], move["version_group_details"][0]["level_learned_at"]]}
    base_states = info_parsed['stats'].map{ |stat| [stat["stat"]["name"], stat["base_stat"]]}
    @base_states = base_states.reverse
  end
end
