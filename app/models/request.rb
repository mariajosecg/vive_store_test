class Request < ApplicationRecord
	enum status: %i[success failed]
end
