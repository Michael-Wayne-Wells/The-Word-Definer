require('sinatra')
    require('sinatra/reloader')
    require('./lib/definer')
    also_reload('lib/**/*.rb')
    get('/') do

    end
    get('/definer') do

    end

    get('/definer/new') do

    end

    get('/definer/:id') do

    end
    post('/definer') do

    end

    get('/definer/:id/edit') do

    end

    patch('/definer/:id') do

    end

    delete('/definer/:id') do

    end

    get('/custom_route') do

    end
    