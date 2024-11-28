### Example Usage
```lua
handlers = exports["afu_api_framework"]:init()
handlers.create("GET", "/hello", function(request, response)
    response.writeHead(200, { ['Content-Type'] = 'application/json' })
    response.send(json.encode({
        msg = "hello, " .. request.data.name
    }))
end, {
    requireBody = true
})
```