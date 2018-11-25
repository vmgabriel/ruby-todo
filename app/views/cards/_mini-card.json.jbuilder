json.extract! card, :id, :name, :details, :dateIn, :dateOut, :state, :Project, :created_at, :updated_at
json.url card_url(card, format: :json)
