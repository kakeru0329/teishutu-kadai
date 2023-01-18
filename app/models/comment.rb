# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :comment, presence: true
end
