module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end
  # The included method belongs to ActiveSupport::Concern.
  # it does: it includes(simply puts as it is) in that module/class that will use Visible module with mixins.

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
