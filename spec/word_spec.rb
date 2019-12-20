require('rspec')
require('word')

describe(Word) do
  before(:each) do
    Word.clear
  end
  describe('.all') do
    it('returns empty array when no words') do
      expect(Word.all).to(eq([]))
    end
  end
  describe('#save') do
    it('add new word to class') do
      word = Word.new({:name => "steve", :id => nil})
      word.save
      word2 = Word.new({:name => "taco", :id => nil})
      word2.save
      expect(Word.all).to(eq([word, word2]))
    end
  end
  describe('.clear') do
    it('clears word list') do
      word = Word.new({:name => "steve", :id => nil})
      word.save
      word2 = Word.new({:name => "taco", :id => nil})
      word2.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end
end
