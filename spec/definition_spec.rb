require('rspec')
require('definition')
require('word')

describe(Definition) do
  before(:each) do
    Word.clear
    Definition.clear
    @word = Word.new({:name => "doug", :id => nil})
  end
  describe('.all') do
    it('returns definitions of words') do
      definition = Definition.new({:text => "A cool guy", :word_id => @word.id, :id => nil})
      definition.save
      definition1 = Definition.new({:text => "to do something poorly", :word_id => @word.id, :id => nil})
      definition1.save
      expect(Definition.all).to(eq([definition, definition1]))
    end
  end
  describe('#save') do
    it('saves new definition for word and assigns id') do
      definition = Definition.new({:text => "A cool guy", :word_id => @word.id, :id => nil})
      definition.save
      expect(definition.text).to(eq('A cool guy'))
    end
  end
  describe('.find') do
    it('finds a definition on the list by the id') do
      definition = Definition.new({:text => "A cool guy", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:text => "to do something poorly", :word_id => @word.id, :id => nil})
      definition2.save
      expect(Definition.find(definition2.id)).to(eq(definition2))
    end
  end
  describe('#delete') do
    it('deletes a definition on the list by the id') do
      definition = Definition.new({:text => "A cool guy", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:text => "to do something poorly", :word_id => @word.id, :id => nil})
      definition2.save
      definition2.delete
      expect(Definition.all).to(eq([definition]))
    end
  end
  describe('#delete') do
    it('deletes a definition on the list by the id') do
      definition = Definition.new({:text => "A cool guy", :word_id => @word.id, :id => nil})
      definition.save
      definition.update("a sad boy")
      expect(definition.text).to(eq("a sad boy"))
    end
  end
  describe('.find_by_word') do
  it('finds definitions by word') do
    word2 = Word.new({:name => "steve", :id => nil})
    word2.save
    definition = Definition.new({:text => "A cool guy", :word_id => @word.id, :id => nil})
    definition.save
    definition2 = Definition.new({:text => "enemy of doug", :word_id => word2.id, :id => nil})
    definition2.save
    expect(Definition.find_by_stage(word2.id)).to(eq([definition2]))
  end
end
end
