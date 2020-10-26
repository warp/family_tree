# frozen_string_literal: true

describe 'four oh four', :feature do
  it 'renders a 404' do
    basic_authorize(Config.http_username, Config.http_password)
    get '/missing/path'

    expect(last_response.body).to match('Not Found')
    expect(last_response).to be_not_found
  end

  it 'returns 401 unauthorized if request is missing authorization headers' do
    get '/missing/path'

    expect(last_response.status).to be 401
  end

  it 'returns 401 unauthorized if request has incorrect username:password' do
    basic_authorize('username', 'wrong password')
    get '/missing/path'

    expect(last_response.status).to be 401
  end
end
