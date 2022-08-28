class Scratch < ApplicationRecord
  after_initialize do
    self.content ||= '' if self.respond_to? :content
  end
end
