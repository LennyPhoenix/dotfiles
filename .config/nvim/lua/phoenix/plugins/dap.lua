local function keybinds()
    require("which-key").register {
        ["<Leader>d"] = {
            name = "Dap",
            d = { "<Cmd>lua require('dapui').toggle()<CR>", "Toggle DapUI" },
            b = { "<Cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
            c = { "<Cmd>lua require('dap').continue()<CR>", "Continue" },
            i = { "<Cmd>lua require('dap').step_into()<CR>", "Step Into" },
            o = { "<Cmd>lua require('dap').step_over()<CR>", "Step Over" },
            r = { "<Cmd>lua require('dap').repl.open()<CR>", "Repl" },
            s = { "<Cmd>lua require('dap').step_out()<CR>", "Step Out" },
        },
    }
end

local function config()
    require("mason-nvim-dap").setup {
        handlers = {
            function(dap_config)
                require("mason-nvim-dap").default_setup(dap_config)
            end,
        },
    }

    local dap, dapui = require("dap"), require("dapui")

    dapui.setup {
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25
                    }, {
                        id = "breakpoints",
                        size = 0.25
                    }, {
                        id = "stacks",
                        size = 0.25
                    }, {
                        id = "watches",
                        size = 0.25
                    }
                },
                position = "left",
                size = 65
            },
            {
                elements = {
                    {
                        id = "repl",
                        size = 0.5
                    }, {
                        id = "console",
                        size = 0.5
                    }
                },
                position = "bottom",
                size = 20
        } },
    }

    vim.fn.sign_define("DapBreakpoint", { text = "#", texthl = "error", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "warn", linehl = "", numhl = "" })

    vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "\\[dap-terminal\\]*",
        callback = vim.schedule_wrap(function(args)
            local window = vim.fn.bufwinid(args.buf)
            if window ~= nil then
                vim.api.nvim_set_current_win(window)
            end
        end)
    })

    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "\\[dap-terminal\\]*",
        callback = vim.schedule_wrap(function()
            vim.cmd("startinsert")
        end)
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end

    keybinds()
end

return {
    --"jay-babu/mason-nvim-dap.nvim",
    "LennyPhoenix/mason-nvim-dap.nvim",
    dependencies = {
        "mason.nvim",
        "which-key.nvim",
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = config
}
