local List = {}
List.__index = List

function List.Check(materialName)
    for _, material in ipairs(Enum.Material:GetEnumItems()) do
        if material.Name == materialName then
            return true
        end
    end
    return false
end

return List