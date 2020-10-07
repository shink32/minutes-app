json.array!(@contents) do |content|

  json.writing content.writing
  json.created_at content.created_at
  json.name content.user.name
  # json.images content.images
  
end

json.test("hoge")