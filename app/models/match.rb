class Match < ActiveRecord::Base
  belongs_to :room
  has_many :answers
  attr_accessible :room, :letter, :started_at, :stopped_at

  validate :validate_letter_in_room

  after_create :set_automatic_stop


  def start!
    self.update_attribute(:started_at, Time.now)
  end

  def stop!
    self.update_attribute(:stopped_at, Time.now)
  end

  private

  def validate_letter_in_room
    errors.add(:letter) if !room.letters.include?(self.letter) || room.matches.where(:letter => self.letter).size > 0
  end

  def set_automatic_stop
    self.update_attribute(:stopped_at, room.maxmatchtime.minutes.from_now)
  end

end
