class Beer < ActiveRecord::Base
  validates :obdb_id, uniqueness: true, presence: true
end
