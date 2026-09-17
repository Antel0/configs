vim.api.nvim_create_user_command("WEx",                                             -- Saves and goes to Ex Mode                    
    function() 
        vim.cmd("w")
        vim.cmd("Ex")
    end, 
    {}
)                          

