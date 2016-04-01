class Feed < ActiveRecord::Base

    # Required for URLs parsing and validation
    require 'uri'
    require 'feed_validator'

    # Will paginate config
    self.per_page = 30

    # Scopes
    default_scope { order('created_at DESC') }

    # Associations
    has_many :entries, dependent: :destroy

    # Validations
    validates_presence_of :name, :url
    validates_uniqueness_of :name, :url
    validates :url, format: { with: URI.regexp }, if: Proc.new { |object| object.url.present? }
    validate :is_ny_times_url?
    validate :is_feed_url?

    # Callbacks
    after_save :enqueue_import_feed

private

    def is_ny_times_url?
        return unless errors.blank?
        if !(/http?:\/\/rss.nytimes.com*/.match(self.url))
            errors.add(:url, "Only NY Times feeds are allowed!")
        end
    end

    # Did user set a valid feed url?
    def is_feed_url?
        return unless errors.blank?
        v = W3C::FeedValidator.new()
        v.validate_url(self.url)
        errors.add(:url, "Not a valid feed!") unless v.valid?
    rescue => e
        errors.add(:url, "Not a valid feed!")
    end

    def enqueue_import_feed
        Resque.enqueue(ImportFeed, self.id)
    end

end
