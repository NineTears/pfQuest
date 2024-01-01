
local function GetCNQuestTitleBack(title)
	return title;
end
local GetCNQuestTitle = GetCNQuestTitle or GetCNQuestTitleBack

local function GetCNItemNameBack(item)
	return item;
end
local GetCNItemName = GetCNItemName or GetCNItemNameBack

local function GetCNUnitNameBack(unit)
	return unit;
end
local GetCNUnitName = GetCNUnitName or GetCNUnitNameBack

function enQuestTitleTocnQuestTitle(title)
	if title == nil then return end
	if GetLocale() == "zhCN" then
		local ttitle = title
		for id, data in pairs(pfDB["quests"]["enUS"]) do
			if data.T == title and pfDB["quests"]["zhCN"][id] then
				ttitle = pfDB["quests"]["zhCN"][id]["T"]
				return ttitle
			end
		end
		return GetCNQuestTitle(title)
	end
	return title
end

function cnenItemName(item, mode)
	if item == nil then return end
	if GetLocale() == "zhCN" then
		if mode == "cntoen" then   --汉译英
			local enitemname = item
			for iid, cnitemname in pairs(pfDB["items"]["zhCN"]) do
				if cnitemname == item and pfDB["items"]["enUS"][iid] then
					enitemname = pfDB["items"]["enUS"][iid]
					return enitemname
				end	
			end
		end
		if mode == "entocn" then   --英译汉
			local cnitemname = item
			for iid, enitemname in pairs(pfDB["items"]["enUS"]) do
				if enitemname == item and pfDB["items"]["zhCN"][iid] then
					cnitemname = pfDB["items"]["zhCN"][iid]
					return cnitemname
				end	
			end
			return GetCNItemName(item)
		end
	end
	return item
end

function cnenUnitName(name, mode)
	if name == nil then return end
	if GetLocale() == "zhCN" then
		if mode == "cntoen" then   --汉译英
			local enunitname = name
			for iid, cnunitname in pairs(pfDB["units"]["zhCN"]) do
				if cnunitname == name and pfDB["units"]["enUS"][iid] then
					enunitname = pfDB["units"]["enUS"][iid]
					return enunitname
				end	
			end
		end
		if mode == "entocn" then   --英译汉
			local cnunitname = name
			for iid, enunitname in pairs(pfDB["units"]["enUS"]) do
				if enunitname == name and pfDB["units"]["zhCN"][iid] then
					cnunitname = pfDB["units"]["zhCN"][iid]
					return cnunitname
				end	
			end
			return GetCNUnitName(name)
		end
	end
	return name
end

function GetCNText(text)
	if text == nil then return end
	local obj, cur, req, objtemp
	if GetLocale() == "zhCN" then
		local bekill = strfind(text, "已杀死")
		if bekill then
			_, _, obj, cur, req = strfind(text, pfUI.api.SanitizePattern(QUEST_MONSTERS_KILLED))
		else
			_, _, obj, cur, req = strfind(text, pfUI.api.SanitizePattern(QUEST_OBJECTS_FOUND))
		end

		if bekill then
			objtemp = "已杀死 " .. cnenUnitName(obj, "entocn")
		else
			objtemp = cnenItemName(obj, "entocn")
		end
		obj = objtemp
	else
		local _, _, obj, cur, req = strfind(gsub(text, "\239\188\154", ":"), "(.*):%s*([%d]+)%s*/%s*([%d]+)")	
	end
	return  _, _, obj, cur, req
end