# frozen_string_literal: true

require "singleton"

class Notepad
  include Singleton
  @notes = {}
  singleton_class.class_eval do
    attr_accessor :notes
  end

  def self.take_note(name, value)
    Notepad.notes[name] = value
  end

  def self.get_note(name)
    Notepad.notes[name]
  end
end
