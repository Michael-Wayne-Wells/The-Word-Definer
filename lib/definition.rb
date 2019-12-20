class Definition
  attr_reader :id
  attr_accessor :text, :word_id

  @@definitions = {}
  @@rows = 0

  def initialize(attributes)
    @text = attributes.fetch(:text)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@rows += 1
  end

  def save
    @@definitions[self.id] = Definition.new({ :text => self.text, :word_id => self.word_id, :id => self.id})
  end

  def self.all
    @@definitions.values()
  end

  def==(to_compare)
    self.text.eql?(to_compare.text())
  end

  def self.clear
    @@definitions = {}
    @@rows = 0
  end

  def self.find(id)
    @@definitions[id]
  end

  def delete
    @@definitions.delete(self.id)
  end

  def update(text)
    self.text = text
    @@definitions[self.id] = Definition.new({:text => self.text, :word_id => self.word_id, :id => self.id})
  end

  def self.find_by_word(word)
    definitions = []
    @@definitions.values().each { |d| definitions.push(d) if d.word_id == word}
    definitions
  end
end
