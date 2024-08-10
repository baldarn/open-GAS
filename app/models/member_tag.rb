# frozen_string_literal: true

class MemberTag < ApplicationRecord
  belongs_to :member
  belongs_to :tag
end
