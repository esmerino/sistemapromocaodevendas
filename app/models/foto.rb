class Foto < ActiveRecord::Base
  attr_accessible :avatar, :hora, :visitum_id, :avatar_cache
  # validates_presence_of :avatar, :hora,:visitum_id, :message =>"false"
  mount_uploader :avatar, AvatarUploader
  belongs_to :visita
end
