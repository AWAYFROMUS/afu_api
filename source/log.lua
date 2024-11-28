--[[

    💬 Export from AFU Squad
    🐌 @Copyright Danyouknowme x Txrxx x Hex

    ☕ Thanks For Coffee Tips  💳 Buy token at awayfromus.dev

]]

Logger = {}
local print = print

function Logger.GetTime()
    ---@comment server side
    if IsDuplicityVersion() then
        return os.date("[%Y-%m-%d %H:%M:%S]")
    end
    local year , month , day , hour , minute , second = GetLocalTime()
    return ("[%04d-%02d-%02d %02d:%02d:%02d]"):format(year , month , day , hour , minute , second)
end

function Logger.info(...)
    print(Logger.GetTime() .. "[^2info^7] ", ...)
end

function Logger.debug(...)
    print(Logger.GetTime() .. "[^5debug^7] ", ...)
end

function Logger.error(...)
    print(Logger.GetTime() .. "[^1error^7] ", ...)
end

function Logger.warning(...)
    print(Logger.GetTime() .. "[^3warning^7] ", ...)
end

function Logger.success(...)
    print(Logger.GetTime() .. "[^6success^7] ", ...)
end