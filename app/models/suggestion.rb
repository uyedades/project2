class Suggestion < ActiveRecord::Base
  set_table_name "suggestion"
  attr_accessible :body
end
