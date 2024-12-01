### Example Usage
```lua
handlers = exports["afu_api_framework"]:init()
handlers.GET("/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})

handlers.POST("/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})

handlers.PUT("/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})

handlers.DELETE("/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})
```