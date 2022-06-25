local indicator_left = ">"
local indicator_right = "<"

local font_grabber = {

    Run = function()

        local asd_http_ouo = require "gamesense/http"

        str_to_sub = function(input, sep)
            local t = {}
            for str in  string.gmatch(input, "([^"..sep.."]+)") do
                t[#t + 1] = string.gsub(str, "\n", "")
            end
            return t
        end
        
        local http_get = function()

            asd_http_ouo.get("https://raw.githubusercontent.com/MLCluanchar/Special-font/main/font.txt", function(success, response)
                if not success or response.status ~= 200 then
                    log("Conection failed")
                end
            
                local tbl = str_to_sub(response.body, '"')
            
                indicator_right = tbl[2]
                indicator_left = tbl[4]
            
            end)

        end
        http_get()
    end

}

font_grabber.Run()