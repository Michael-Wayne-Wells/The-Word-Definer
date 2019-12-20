require('rspec')
require('word')

describe(Word) do
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
      expect(Word.all).to(eq([word1, word2]))
    end
  end
end
