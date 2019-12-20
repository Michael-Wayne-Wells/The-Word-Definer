require('rspec')
require('word')

describe(Word) do
  describe('.all') do
    it('returns empty array when no words') do
      expect(Word.all).to(eq([]))
    end
  end
end
