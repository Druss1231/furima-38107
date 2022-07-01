class Order < ApplicationRecord
  class Order < ApplicationRecord
    attr_accessor :token
    validates :token, presence: true
  end
end
