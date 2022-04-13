# frozen_string_literal: true

# == Schema Information
#
# Table name: rooms
#
#  id       :bigint           not null, primary key
#  guid     :string           not null
#  name     :string           not null
#  order    :integer
#  size     :integer
#  url      :string
#  venue_id :integer          not null
#
class Room < ApplicationRecord
  include RevisionCount
  belongs_to :venue
  has_many :event_schedules, dependent: :destroy
  has_many :tracks

  has_paper_trail ignore: [:guid], meta: { conference_id: :conference_id }

  before_create :generate_guid

  validates :name, :venue_id, presence: true

  validates :size, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :order, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  default_scope { order(order: :asc) }

  # Cache Busting on the events page, touch all events.
  after_update lambda {
    return unless previous_changes[:url]

    event_schedules.update_all(updated_at: Time.now)
  }

  def conference
    venue.conference
  end

  private

  def generate_guid
    guid = SecureRandom.urlsafe_base64
    self.guid = guid
  end

  def conference_id
    venue.conference_id
  end
end
