describe 'four oh four', :feature do
  it 'renders a 404' do
    get '/missing/path'

    expect(last_response.body).to match('Not Found')
    expect(last_response).to be_not_found
  end
end
