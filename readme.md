### Example Usage
```lua
api = exports["afu_api"]:init()
api.GET("/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})

api.POST("/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})

api.PUT("/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})

api.DELETE("/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})
```
