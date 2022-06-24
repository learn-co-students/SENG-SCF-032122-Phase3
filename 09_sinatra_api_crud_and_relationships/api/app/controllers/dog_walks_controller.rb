class DogWalksController < ApplicationController
  post "/dog_walks" do 
    serialize(DogWalk.create(dog_walk_params))
  end

  patch "/dog_walks/:id" do
    dog_walk = DogWalk.find(params[:id])
    dog_walk.update(dog_walk_params)
    serialize(dog_walk)
  end

  delete "/dog_walks/:id" do
    dog_walk = DogWalk.find(params[:id])
    dog_walk.destroy
    # status 204
    serialize(dog_walk)
  end

  private 

  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def dog_walk_params
    allowed_params = %w(dog_id walk_time pooped)
    params.select {|param,value| allowed_params.include?(param)}
  end

  def serialize(objects)
    objects.to_json(methods: :formatted_time)
  end

end