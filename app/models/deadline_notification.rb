# frozen_string_literal: true

class DeadlineNotification < Notification
  def deliver
    Deliverer.deadline_notification(self).deliver_now
  end

  def <=>(other)
    deadline <=> other.deadline
  end

  def sendable?
    enabled? && has_email? && due_for_judgement? && !withdrawn?
  end

  def self.known
    all.reject(&:unknown?)
  end

  def self.unknown
    all.select(&:unknown?)
  end
end
