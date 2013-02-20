get '/' do 
  redirect to '/home'
end 

get '/home' do 
  erb :home
end

get '/categories' do
  @categories = Category.all
  erb :categories
end

get '/categories/:category_id' do 
  @posts = Post.where :category_id => params[:category_id]
  @category = Category.find params[:category_id]
  erb :category_posts  
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

get '/posts/new' do
  @categories = Category.all
  erb :new_post
end 


get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end

post '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  @post.update_attributes(:title        => params[:title], 
                          :description  => params[:description],
                          :email        => params[:email],
                          :price        => params[:price],
                          :category_id  => params[:category_id]) #Why is params hash polluted?!?!?
  #splat was in params hash!!!
  erb :post
end

post '/posts' do 
  post = Post.new params
  post.save!
  redirect to "/posts/#{post.id}/edit?key=#{post.unique_key}"
end


get "/posts/:id/edit" do
  @categories = Category.all
  @post = Post.find_by_unique_key(params[:key]) # security breach!
  if @post
    erb :edit_post
  else
   erb :hacker_warning
  end 
end 




