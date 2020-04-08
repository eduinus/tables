local serialization = require("serialization")

function tableLength(table)
  count = 1
  while table[count] ~= nil do
    count=count+1
  end
  return count-1
end

function loadTable(location)
  --returns a table stored in a file.
  local tableFile = io.open(location,"r")
  if tableFile == nil then return {} end
  return serialization.unserialize(tableFile:read("*all"))
end
 
function saveTable(table, location)
  --saves a table to a file
  local tableFile = io.open(location, "w")
  tableFile:write(serialization.serialize(table))
  tableFile:close()
end
