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
      definition1 = Definition.new({:text => "to do something poorly", :word_id => @word.id, :id => nil})
      definition1.save
      expect(Definition.find(definition2.id)).to(eq(definition2))
    end
  end
end
