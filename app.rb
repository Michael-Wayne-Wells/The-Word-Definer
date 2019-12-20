require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  redirect to('/words')
end
get('/words') do
  @words = Word.sort
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/search') do
  @word = Word.find(params[:id].to_i())
  search = params[:search]
  @results = Word.search(search)
  erb(:search)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end

post('/words') do
  name = params[:word]
  word = Word.new({:name => name, :id => nil})
  word.save
  redirect to('/words')
end

get('/words/:id/edit') do
@word = Word.find(params[:id].to_i())
erb(:edit_word)
end

patch('/words/:id') do
@word = Word.find(params[:id].to_i())
@word.update(params[:new_name])
redirect to('/words')
end

delete('/words/:id') do
@word = Word.find(params[:id].to_i())
@word.delete
redirect to('/words')
end


get('/words/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:def_id].to_i())
  erb(:definition)

end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  text = params[:new_def]
  definition = Definition.new({:text => text, :word_id => @word.id, :id => nil})
  definition.save
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end

patch('/words/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:def_id].to_i())
  definition.update(params[:new_def])
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end
delete('/words/:id/definitions/:def_id') do
  definition = Definition.find(params[:def_id].to_i())
  definition.delete
  @definitions = Definition.find_by_word(params[:id].to_i())
  redirect to("/words/#{definition.word_id}")
end
