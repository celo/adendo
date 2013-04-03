class Match < ActiveRecord::Base
  belongs_to :room
  has_many :answers
  attr_accessible :room, :letter, :started_at, :stopped_at

  validate :validate_letter_in_room


  def start!
    if !started? && !stopped?
      self.update_attribute(:started_at, Time.now)
      self.update_attribute(:stopped_at, room.maxmatchtime.minutes.from_now)
    end
  end

  def stop!
    if started? && !stopped?
      self.update_attribute(:stopped_at, Time.now)
    end
  end

  def started?
    !started_at.nil?
  end

  def stopped?
    !stopped_at.nil? && stopped_at < Time.now
  end

  private

  def validate_letter_in_room
    errors.add(:letter) if !room.letters.include?(self.letter) || room.matches.where(:letter => self.letter).size > 0
  end

end
