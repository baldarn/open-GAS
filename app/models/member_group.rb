# frozen_string_literal: true

class MemberGroup < ApplicationRecord
  belongs_to :member
  belongs_to :group
end
