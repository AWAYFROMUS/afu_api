--[[

    💬 Export from AFU Squad
    🐌 @Copyright Danyouknowme x Txrxx x Hex

    ☕ Thanks For Coffee Tips  💳 Buy token at awayfromus.dev
    
]]

local handlers = {
    ready = promise.new(),
    core = {
        POST = {},
        GET = {},
        PUT = {},
        DELETE = {}
    }
}

---@param method string "GET" | "POST" | "PUT" | "DELETE"
---@param path string /path 
---@param callback function (request: Request, response: Response) 
---@param options table {requireBody: boolean}
---@return void
function handlers.create(method, path, callback, options)
    handlers.core[method][path] = function(request, response)

        local oldSend = response.send
        response.send = function(data)
            if type(data) == "table" or type(data) == "function" then
                Logger.error("response.send only accept string, buffer or bytes")
                return
            end
            oldSend(data)
        end

        request.setDataHandler(function(data)
            request.body = data
            request.data = json.decode(data)
            callback(request, response)
        end)
        if not request.body then
            if options and options.requireBody then
                response.writeHead(400, { ['Content-Type'] = 'application/json' })
                response.send(json.encode({
                    status = 400,
                    msg = "missing body"
                }))
                return
            end
           callback(request, response)
        end
       
        request.setCancelHandler(function()
            print("[^3-^0] request to " .. path .. " was cancelled")
        end)
    end
    print(("[^2+^0] handler created ^3%s^0 ^2%s%s^0"):format(method, handlers.getEndpoint(),path))
end

---@return string url api url ของ script นี้ eg. http://localhost:3000/afu_mailbox
function handlers.getEndpoint()
    return ("%s/%s"):format(GetConvar("web_baseUrl", ""), GetCurrentResourceName())
end

---@return void - เริ่มต้น http server
function handlers.run()
    SetHttpHandler(function(request, response)
        if handlers.core[request.method] and handlers.core[request.method][request.path] then
            handlers.core[request.method][request.path](request, response)
        else
            response.writeHead(404, { ['Content-Type'] = 'application/json' })
            response.send(json.encode({
                msg = "not found"
            }))
        end
    end)
    pcall(function()
        handlers.ready:resolve()
    end)
    print("[^2+^0] http server started. " .. ("endpoint is ^2%s^0"):format(handlers.getEndpoint()))
end

handlers.run()

exports("init", function()
    Citizen.Await(handlers.ready)
    return handlers
end)