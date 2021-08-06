class PokemonApi
  attr_accessor :name, :url, :height, :weight
  attr_reader :number, :types, :color, :image, :moves, :base_states, :abilities, :image_battle, :image_battle_back
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
    pokemon = PokemonApi.new(url: url, name: pokemon_parsed["name"], height: pokemon_parsed["height"], weight: pokemon_parsed["weight"])
  end

  def initialize(name: "", url:, move:"", height:"", weight:"")
    @name = name
    @url = url
    @height = height
    @weight = weight
    get_info
  end

  # def save(user)
  #   if user.favorites.count == 6
  #   # attributes = { name: name }
  #   # pokemon = user.pokemons.build(attributes)
  #   # if pokemon.save
  #   else
  #     user.favorites << pokemon
  #   else
  #   end
  # end

  def new_pokemon(user)
    attributes = {name: @name, level: 0, number: @number, types: @types, height: @height, weight: @weight, abilities: @abilities, moves: @moves, base_states: @base_states}
    # pokemon = user.pokemons.build(attributes)
    pokemon = user.pokemons.build(attributes)
    pokemon.images.attach(io: open(@image), filename: 'image.jpg')
    pokemon.images.attach(io: open(@image_battle), filename: 'image.jpg')
    pokemon.images.attach(io: open(@image_battle_back), filename: 'image.jpg')
    pokemon.save
    pokemon
  end

  private

  def get_info
    info = RestClient.get(@url, { accept: 'application/json' })
    info_parsed = JSON.parse(info.body)
    @number = info_parsed['id']
    @types = info_parsed['types'].map{|type| type["type"]["name"] }
    @color = @types.first.downcase
    @image_battle = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{@number}.png"
    @image_battle_back="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/#{@number}.png"
    #@image = "https://pokeres.bastionbot.org/images/pokemon/#{@number}.png"
    @image = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{@number}.png"
    @moves = info_parsed['moves'].map{ |move| [move["move"]["name"], move["version_group_details"][0]["level_learned_at"]]}
    base_states = info_parsed['stats'].map{ |stat| [stat["stat"]["name"], stat["base_stat"]]}
    @base_states = base_states.reverse
    @abilities = info_parsed['abilities'].map{|ability| ability["ability"]["name"] }
  end
end
