# json.extract! @guest, :name, :age, :favorite_color
# json.gifts do
#   json.array! @guest.gifts, :title, :description
# end

json.name @party.name

json.guests.do
  json.guests.array! @party.guests do |guest|
    json.name guest.name

    json.gifts do
      json.array! guests.gift, :title
    end
  end
end
