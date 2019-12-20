require('rspec')
require('word')

describe(Word) do
  describe('.all') do
    it('returns empty array when no words') do
      expect(test.all()).to(eq([]))
    end
  end
end
