class Definition
  attr_reader :id
  attr_accessor :text

  @@defintions = {}
  @@rows = 0

  def initialize(attributes)
    @text = attributes.fetch(:text)
    @id = attributes.fetch(:id) || @@rows += 1
  end

  def save
    @@defintions[self.id] = Definition.new({ :text => self.text, :id => self.id})
  end

  def self.all
    @@defintions.values()
  end

  def==(to_compare)
    self.text.eql?(to_compare.text())
  end

  def self.clear
    @@defintions = {}
    @@rows = 0
  end

  def self.find(id)
    @@defintions[id]
  end

  def delete
    @@defintions.delete(self.id)
  end


end
