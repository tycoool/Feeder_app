class Entry < ActiveRecord::Base

    # Will paginate config
    self.per_page = 10

    # Scopes
    default_scope { order('published DESC') }
    scope :likes, -> { where(like: true) }

    # Associations
    belongs_to :feed

    # Validations
    validates_presence_of :feed_id, :url, :published, :g_id, :title # :content may be missing, but that's ok
    validates_uniqueness_of :g_id

end
