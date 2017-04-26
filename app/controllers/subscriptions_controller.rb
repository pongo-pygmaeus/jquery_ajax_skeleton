#CREATE (POST)

post '/users/:user_id/subscriptions/?' do

  debug "*", "Inside post route"
  debug "*", params

  user_id    = params['user_id']
  channel_id = params['channel_id']

  subscription = Subscription.new( :user_id    => User.find(user_id).id,
                                   :channel_id => Channel.find(channel_id).id )

  if subscription.save!
    redirect "/users/#{user_id}"
  else
    redirect "/users/#{user_id}"
  end
   
end

#DELETE (POST)

delete '/users/:user_id/subscriptions/:id' do

  debug "*", "Inside delete route"
  debug "*", params

  user_id         = params['user_id']
  subscription_id = params['id']

  Subscription.delete(Subscription.find(subscription_id))

  redirect "/users/#{user_id}"

end