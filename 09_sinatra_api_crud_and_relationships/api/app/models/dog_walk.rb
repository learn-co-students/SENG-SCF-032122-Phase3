class DogWalk < ActiveRecord::Base
  belongs_to :dog
  belongs_to :walk

  scope :with_poop, -> { where(pooped: true) }

  delegate :formatted_time, to: :walk

  def walk_time=(time)
    if self.walk
      self.walk.update(time: time)
    else
      self.walk = Walk.create(time: time)
    end
  end
  
end