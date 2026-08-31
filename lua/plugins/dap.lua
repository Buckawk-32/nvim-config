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
            local opts = { noremap = true, silent = true, nowait = true }
            local mapNormal = function (keybind, func)
                vim.keymap.set("n", keybind, func, opts)
            end

            opts.desc = "Toggle Breakpoint"
            mapNormal("<leader>db", dap.toggle_breakpoint)

            opts.desc = "Breakpoint Condition"
            -- mapNormal("<leader>dB", dap.set_breakpoint(vim.fn.input("Breakpoint Condition: ")))

            opts.desc = "Run/Continue"
            mapNormal("<leader>dc", dap.continue)

            opts.desc = "Run with Args"
            -- mapNormal("<leader>da", dap.continue({ before = get_args }))

            opts.desc = "Run to Cursor"
            mapNormal("<leader>dC", dap.run_to_cursor)

            opts.desc = "Go to Line (No Execute)"
            mapNormal("<leader>dg", dap.goto_)

            opts.desc = "Step Into"
            mapNormal("<leader>di", dap.step_into)

            opts.desc = "Down"
            mapNormal("<leader>dj", dap.down)

            opts.desc = "Up"
            mapNormal("<leader>dk", dap.up)

            opts.desc = "Run Last"
            mapNormal("<leader>dl", dap.run_last)

            opts.desc = "Step Out"
            mapNormal("<leader>do", dap.step_out)

            opts.desc = "Step Over"
            mapNormal("<leader>dO", dap.step_over)

            opts.desc = "Pause"
            mapNormal("<leader>dP", dap.pause)

            opts.desc = "Toggle REPL"
            mapNormal("<leader>dr", dap.repl.toggle)

            opts.desc = "Session"
            mapNormal("<leader>Ds", dap.session)

            opts.desc = "Terminate"
            mapNormal("<leader>dq",
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
                    "cppdbg",
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
