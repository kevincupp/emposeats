class BTTFQuote < ActiveRecord::Base
  self.table_name = 'btfquotes'

  def self.random
    order("RAND()").first.quote
  end
end
