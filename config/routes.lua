local routes = require 'gin.core.routes'

-- define version
local v1 = routes.version(1)

-- define routes
v1:GET("/", { controller = "pages", action = "root" })
v1:GET("/users", { controller = "users", action = "index" })

return routes
