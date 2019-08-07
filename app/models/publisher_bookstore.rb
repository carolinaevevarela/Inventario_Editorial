class PublisherBookstore < ApplicationRecord
  belongs_to :publisher
  belongs_to :bookstore
end
