-- @author Hone Watson
-- @email comments@hone.be
-- @copyright  Copyright (c) 2013 Hone Watson
-- @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)

local spec_server = require("lapis.spec.server")
local request = spec_server.request
require 'spec.spec_helper'
local do_results = function(results)
    for k, v in pairs(results) do
        print(k .. v.first_name)
    end
end
describe("my site", function()
    setup(function()
        spec_server.load_test_server()
    end)

    teardown(function()
        spec_server.close_spec_server()
    end)

    it("should load /", function()
--        local db = require 'db.mysql'
--        local adapter = db.adapter
--        local options = db.options
--
--        results = adapter.execute(options, "SELECT * FROM users;")
--        for k, v in pairs(results) do
--            print(k .. v.first_name)
--        end

--        print(MySql.de)
        local client = require('db.client').new()
        local sql = "SELECT * FROM users WHERE first_name = :first_name;"
        result = client:insert("INSERT INTO users (first_name, last_name) VALUES (:first_name, :last_name) ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id), last_name = VALUES(last_name);", {first_name = "albert", last_name = "monkey"})
        print(result)
        results = client:query(sql, {first_name = "roberta", badger = "furry"})
        do_results(results)
        results = client:query(sql, {first_name = "albert", badger = "furry"})
        do_results(results)
    end)
end)