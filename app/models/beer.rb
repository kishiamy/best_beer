class Beer < ActiveRecord::Base
  validates :obdb_id, uniqueness: true, presence: true

  def add_vote
    votes.present? ? self.votes +=1 : self.votes = 1
    self.save #update_attribute
  end
end
