# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  mod_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  # before_action :is_moderator?

  validates :title, :mod_id, presence: true, uniqueness: true

  def is_moderator?(id)
    self.mod_id == id
    #potential_sub = Sub.find_by(mod_id: id)
  end

end
