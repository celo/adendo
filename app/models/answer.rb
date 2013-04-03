class Answer < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  belongs_to :column
  attr_accessible :score, :value, :player, :match, :column

  validates_presence_of :player_id, :match_id, :column_id, :value
  validates :score, :inclusion => { :in => [0, 5, 10] }, :allow_nil => true

  validate :check_start_time
  validate :check_stop_time, :on => :create
  validate :check_stopped_match, :on => :update


  def check_start_time
    errors.add(:match_id) if !match.started?
  end

  def check_stop_time
   errors.add(:match_id) if match.stopped?
  end

  def check_stopped_match
    errors.add(:match_id) if !match.stopped?
  end

end
