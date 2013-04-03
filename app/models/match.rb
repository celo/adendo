class Match < ActiveRecord::Base
  belongs_to :room
  has_many :answers
  attr_accessible :room, :letter, :started_at, :stopped_at

  validate :validate_letter_in_room_on_create, :on => :create
  validate :validate_letter_in_room_on_update, :on => :update


  def start!
    if !started? && !stopped?
      self.update_attribute(:started_at, Time.now)
      self.update_attribute(:stopped_at, room.maxmatchtime.minutes.from_now)
    end
  end

  def stop!(player)
    if started? && !stopped? && complete?(player)
      self.update_attribute(:stopped_at, Time.now)
    end
  end

  def started?
    !started_at.nil?
  end

  def stopped?
    !stopped_at.nil? && stopped_at < Time.now
  end

  def complete?(player)
    answers.where(:player_id => player).count == room.columns.count
  end

  private

  def validate_letter_in_room_on_create
    errors.add(:letter) if !room.letters.include?(self.letter) || room.matches.where(:letter => self.letter).size > 0
  end

  def validate_letter_in_room_on_update
    errors.add(:letter) if !room.letters.include?(self.letter) || room.matches.where(:letter => self.letter).size > 1
  end

end
