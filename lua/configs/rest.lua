require("rest-nvim").setup({
  -- Open request results in a horizontal split
  result_split_horizontal = false,
  
  -- Skip SSL verification, useful for testing
  skip_ssl_verification = false,
  
  -- Encode URL automatically
  encode_url = true,
  
  -- Highlight request on run
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
        formatter = function(response)
            local jq_cmd = "jq"
            local handle = io.popen(jq_cmd, "w")
            if handle then
                handle:write(response)
                handle:close()
            end
        end,
    }, 
  -- Jump to request line on run
  jump_to_request = false,
})
