class PokemonApi
  attr_accessor :name, :url
  attr_reader :id, :types, :color, :image

  URL = 'https://pokeapi.co/api/v2/pokemon?limit=12&offset=0'

  def self.all
    response = RestClient.get(URL, { accept: 'application/json' })
    pokemons = JSON.parse(response.body)['results'].map do |pokemon|
      pokemon_api = PokemonApi.new(name: pokemon["name"], url: pokemon["url"])
    end
    pokemons
  end

  def self.id(id)
    url = "https://pokeapi.co/api/v2/pokemon/#{id}"
    # response = RestClient.get(url, { accept: 'application/json' })
    # pokemon_parsed = JSON.parse(response.body)
    pokemon = PokemonApi.new(url: url)
  end

  def initialize(name: "", url:)
    @name = name
    @url = url
    get_info
  end


  private

  def get_info
    info = RestClient.get(@url, { accept: 'application/json' })
    info_parsed = JSON.parse(info.body)
    @id = info_parsed['id']
    @types = info_parsed['types'].map{|type| type["type"]["name"] }
    @color = @types.first.downcase
    @image = info_parsed['sprites']["front_default"]
  end
end
