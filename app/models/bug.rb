class Bug < ApplicationRecord
    belongs_to :project, optional: true
end
