require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload('./models/*')

# index - all the pizzas
get '/pizza-orders' do
  @orders = PizzaOrder.all()

  erb(:index)
end

# create a pizza
get  '/pizza-orders/new' do
  erb(:new)
end

# show - show one pizza
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end


# create - make a pizza order
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# delete a pizza order
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect to '/pizza-orders'
end

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id/update' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect to '/pizza-orders'
end
