
function cnenQuestTitle(title, mode)
	if title == nil then return end	
	if GetLocale() == "zhCN" then
		if mode == "cntoen" then   --汉译英
			local entitle
			for id, data in pairs(pfDB["quests"]["zhCN"]) do
				if data.T == title and pfDB["quests"]["enUS"][id] then
					entitle = pfDB["quests"]["enUS"][id]["T"]
					if entitle then
						return entitle
					else
						return title
					end
				end
			end
			return title		
		end
		if mode == "entocn" then   --英译汉
			local cntitle
			for id, data in pairs(pfDB["quests"]["enUS"]) do
				if data.T == title and pfDB["quests"]["zhCN"][id] then
					cntitle = pfDB["quests"]["zhCN"][id]["T"]
					if cntitle then
						return cntitle
					else
						return title
					end
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
		if mode == "cntoen" then   --汉译英
			local enitemname
			for id, cnitemname in pairs(pfDB["items"]["zhCN"]) do
				if cnitemname == item and pfDB["items"]["enUS"] then
					enitemname = pfDB["items"]["enUS"][id]
					if enitemname then
						return enitemname
					else
						return item
					end
				end	
			end
			return item
		end
		if mode == "entocn" then   --英译汉
			local cnitemname
			for id, enitemname in pairs(pfDB["items"]["enUS"]) do
				if enitemname == item and pfDB["items"]["zhCN"] then
					cnitemname = pfDB["items"]["zhCN"][id]
					if cnitemname then
						return cnitemname
					else
						return item
					end
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
		if mode == "cntoen" then   --汉译英
			local enunitname = name
			for id, cnunitname in pairs(pfDB["units"]["zhCN"]) do
				if cnunitname == name and pfDB["units"]["enUS"][id] then
					enunitname = pfDB["units"]["enUS"][id]
					if enunitname then
						return enunitname
					else
						return name
					end
				end	
			end
			return name
		end
		if mode == "entocn" then   --英译汉
			local cnunitname
			for id, enunitname in pairs(pfDB["units"]["enUS"]) do
				if enunitname == name and pfDB["units"]["zhCN"][id] then
					cnunitname = pfDB["units"]["zhCN"][id]
					if cnunitname then
						return cnunitname
					else
						return name
					end
				end
			end
			return name
		end
	end
	return name
end
