class Beer < ActiveRecord::Base
  validates :obdb_id, uniqueness: true, presence: true

  def add_vote
    votes.present? ? votes +=1 : votes = 1
    self.save
  end
end
