local status_ok, uv = pcall(require, "uv")
if not status_ok then
    return
end

uv.setup({})
