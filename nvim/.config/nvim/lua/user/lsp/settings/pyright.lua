return {
    settings = {
        python = {
           venvPath = ".venv",
           pythonPath = ".venv/bin/python",
            analysis = {
                typeCheckingMode = "off",
                diagnosticMode = "workspace",
                lineLength = 120,
                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                },
            },
        },
    },
}

