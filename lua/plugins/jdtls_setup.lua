local M = {}

function M:setup()
    local projectName = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspaceDir = "/home/buckawk32/.jdtls_data/" .. projectName

    local config = {
        cmd = {
            "/usr/lib/jvm/java-26-openjdk/bin/java",

            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xmx1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

            '-jar',
            '/home/buckawk32/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.200.v20260619-2039.jar',

            '-configuration',
            '/home/buckawk32/.local/share/nvim/mason/packages/jdtls/config_linux',

            '-data',
            workspaceDir,
        },

        rootDir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}),

        settings = {
            java = {},
        },
    }

    require("jdtls").start_or_attach(config)
end

return M
