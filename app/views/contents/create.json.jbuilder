json.array!(@content) do |content|

  json.wrinting content.wrinting
  json.created_at content.created_at
  json.name content.user.name
  json.images content.images
  
end

name