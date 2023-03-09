RSpec.describe 'Routes', type: :routing do
  describe 'GET /' do
    it 'routes to static_pages#home' do
      expect(get: '/').to route_to(controller: 'static_pages', action: 'home')
    end
  end

  describe 'GET /help' do
    it 'routes to static_pages#help' do
      expect(get: '/help').to route_to(controller: 'static_pages', action: 'help')
    end
  end

  describe 'GET /cars' do
    it 'routes to cars#index' do
      expect(get: '/cars').to route_to(controller: 'cars', action: 'index')
    end
  end

  describe 'GET /searches/new' do
    it 'routes to searches#new' do
      expect(get: '/searches/new').to route_to(controller: 'searches', action: 'new')
    end
  end

  describe 'POST /searches' do
    it 'routes to searches#create' do
      expect(post: '/searches').to route_to(controller: 'searches', action: 'create')
    end
  end
end
