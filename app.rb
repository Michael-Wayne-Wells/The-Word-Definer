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

end

get('/words/new') do

end

get('/words/:id') do

end
post('/words') do

end

get('/words/:id/edit') do

end

patch('/words/:id') do

end

delete('/words/:id') do

end

get('/words/search') do
  
end
