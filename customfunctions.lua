
function containsChinese(inputString)
    return string.match(inputString, "[\128-\255]") ~= nil
end

function cnenQuestTitle(title, mode)
    if title == nil then return end
    
    if GetLocale() == "zhCN" then
        if mode == "cntoen" and containsChinese(title) then   -- 汉译英
            local entitle
            for id, data in pairs(pfDB["quests"]["zhCN"]) do
                if data.T == title and pfDB["quests"]["enUS"][id] then
                    entitle = pfDB["quests"]["enUS"][id]["T"]
                    return entitle or title
                end
            end
            return title
        end

        if mode == "entocn" and (not containsChinese(title)) then   -- 英译汉
            local cntitle
            for id, data in pairs(pfDB["quests"]["enUS"]) do
                if data.T == title and pfDB["quests"]["zhCN"][id] then
                    cntitle = pfDB["quests"]["zhCN"][id]["T"]
                    return cntitle or title
                end
            end
            return title
        end
    end
    
    return title
end

function cnenItemName(item, mode)
    if item == nil then return end
    
    if GetLocale() == "zhCN" then
        if mode == "cntoen" and containsChinese(item) then   -- 汉译英
            local enitemname
            for id, cnitemname in pairs(pfDB["items"]["zhCN"]) do
                if cnitemname == item and pfDB["items"]["enUS"][id] then
                    enitemname = pfDB["items"]["enUS"][id]
                    return enitemname or item
                end
            end
            return item
        end

        if mode == "entocn" and (not containsChinese(item)) then   -- 英译汉
            local cnitemname
            for id, enitemname in pairs(pfDB["items"]["enUS"]) do
                if enitemname == item and pfDB["items"]["zhCN"][id] then
                    cnitemname = pfDB["items"]["zhCN"][id]
                    return cnitemname or item
                end
            end
            return item
        end
    end
    
    return item
end

function cnenUnitName(name, mode)
    if name == nil then return end
    
    if GetLocale() == "zhCN" then
        if mode == "cntoen" and containsChinese(name) then   -- 汉译英
            local enunitname = name
            for id, cnunitname in pairs(pfDB["units"]["zhCN"]) do
                if cnunitname == name and pfDB["units"]["enUS"][id] then
                    enunitname = pfDB["units"]["enUS"][id]
                    return enunitname or name
                end
            end
            return name
        end

        if mode == "entocn" and (not containsChinese(name)) then   -- 英译汉
            local cnunitname = name
            for id, enunitname in pairs(pfDB["units"]["enUS"]) do
                if enunitname == name and pfDB["units"]["zhCN"][id] then
                    cnunitname = pfDB["units"]["zhCN"][id]
                    return cnunitname or name
                end
            end
            return name
        end
    end
    
    return name
end
