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
  describe('.find') do
    it('finds a word on the list by the id') do
      word = Word.new({:name => "steve", :id => nil})
      word.save
      word2 = Word.new({:name => "taco", :id => nil})
      word2.save
      expect(Word.find(word2.id)).to(eq(word2))
    end
  end
  describe('#delete') do
    it('deletes a word on the list by the id') do
      word = Word.new({:name => "steve", :id => nil})
      word.save
      word2 = Word.new({:name => "taco", :id => nil})
      word2.save
      word2.delete
      expect(Word.all).to(eq([word]))
    end
  end
end
