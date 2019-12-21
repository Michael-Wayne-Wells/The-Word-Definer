class Word
  attr_reader :id
  attr_accessor :name

  @@words = {}
  @@rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@rows += 1
  end

  def save
    @@words[self.id] = Word.new({ :name => self.name, :id => self.id})
  end

  def self.all
    @@words.values()
  end

  def==(to_compare)
    self.name.eql?(to_compare.name())
  end

  def self.clear
    @@words = {}
    @@rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def delete
    @@words.delete(self.id)
  end

  def update(name)
    self.name = name
    @@words[self.id] = Word.new({:name => self.name, :id => self.id})
  end

  def self.search(term)
    @@words.values().select { | word | word.name.match(/#{term}/i)}
  end

  def self.sort
    @@words.values().sort_by{ |k,v| k.name}
  end

end
