
    require('rspec')
    require('definer')

    describe(Word) do
    describe('#new') do
      it('test') do
        test = Word.new()
        expect(test.new()).to(eq('test'))
      end
    end
  end
  