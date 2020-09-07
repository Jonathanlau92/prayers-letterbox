require "administrate/base_dashboard"

class PrayerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    request: Field::Text,
    # user_particulars: Field::JSONB.with_options(transform: %i[to_h symbolize_keys], advanced_view: {
    #   name: Field::String
    # }),
    is_deleted: Field::Boolean,
    prayer_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    private: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  request
  is_deleted
  private
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  request
  is_deleted
  prayer_count
  created_at
  updated_at
  private
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  request
  is_deleted
  prayer_count
  private
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how prayers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(prayer)
  #   "Prayer ##{prayer.id}"
  # end
end
