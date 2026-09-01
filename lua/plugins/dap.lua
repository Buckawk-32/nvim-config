return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = {},
            },
        },
        config = function ()
            local dap = require("dap")
            local dapui = require("dapui")
            local dapVirText = require("nvim-dap-virtual-text")

            dapVirText.setup({})


            -- Keys:
            local opts = { noremap = true, silent = true }
            local mapNormal = function (keybind, func)
                vim.keymap.set("n", keybind, func, opts)
            end

            opts.desc = "Toggle Breakpoint"
            mapNormal("<leader>bb", dap.toggle_breakpoint)

            opts.desc = "Breakpoint Condition"
            -- mapNormal("<leader>bB", dap.set_breakpoint(vim.fn.input("Breakpoint Condition: ")))

            opts.desc = "Run/Continue"
            mapNormal("<leader>bc", dap.continue)

            opts.desc = "Run with Args"
            -- mapNormal("<leader>ba", dap.continue({ before = get_args }))

            opts.desc = "Run to Cursor"
            mapNormal("<leader>bC", dap.run_to_cursor)

            opts.desc = "Go to Line (No Execute)"
            mapNormal("<leader>bg", dap.goto_)

            opts.desc = "Step Into"
            mapNormal("<leader>bi", dap.step_into)

            opts.desc = "Down"
            mapNormal("<leader>bj", dap.down)

            opts.desc = "Up"
            mapNormal("<leader>bk", dap.up)

            opts.desc = "Run Last"
            mapNormal("<leader>bl", dap.run_last)

            opts.desc = "Step Out"
            mapNormal("<leader>bo", dap.step_out)

            opts.desc = "Step Over"
            mapNormal("<leader>bO", dap.step_over)

            opts.desc = "Pause"
            mapNormal("<leader>bP", dap.pause)

            opts.desc = "Toggle REPL"
            mapNormal("<leader>br", dap.repl.toggle)

            opts.desc = "Session"
            mapNormal("<leader>bs", dap.session)

            opts.desc = "Terminate"
            mapNormal("<leader>bq",
                function ()
                    require("dap").terminate()
                    require("dapui").close()
                    require("nvim-dap-virtual-text").toggle()
                end
            )

            dap.adapters = {
                gdb = {
                    type = "executable",
                    command = "gdb",
                    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
                }
            }

            dap.configurations = {
                python = {
                    {
                        -- The first three options are required by nvim-dap
                        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
                        request = 'launch';
                        name = "Launch file";

                        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                        program = "${file}"; -- This configuration will launch the current file if used.
                        pythonPath = function()
                            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                            local cwd = vim.fn.getcwd()
                            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                                return cwd .. '/venv/bin/python'
                            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                                return cwd .. '/.venv/bin/python'
                            else
                                return '/usr/bin/python'
                            end
                        end;
                    },
                },
                c = {
                    {
                        name = "Launch",
                        type = "gdb",
                        request = "launch",
                        program = function()
                            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        end,
                        cwd = "${workspaceFolder}",
                        stopAtBeginningOfMainSubprogram = false,
                    },
                    {
                        name = "Select and attach to process",
                        type = "gdb",
                        request = "attach",
                        program = function()
                            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        end,
                        pid = function()
                            local name = vim.fn.input('Executable name (filter): ')
                            return require("dap.utils").pick_process({ filter = name })
                        end,
                        cwd = '${workspaceFolder}'
                    },
                    {
                        name = 'Attach to gdbserver :1234',
                        type = 'gdb',
                        request = 'attach',
                        target = 'localhost:1234',
                        program = function()
                            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        end,
                        cwd = '${workspaceFolder}'
                    },
                },
                -- lua = {
                --
                -- }
            }



            dapui.setup()

            -- Nvim-Dap -> Dap-UI
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end


        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        config = function ()
            require("mason-nvim-dap").setup({
                automatic_installation = false,
                ensure_installed = {
                    "python",
                },
                handlers = {
                    function (config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                }
            })
        end,
    }
}
