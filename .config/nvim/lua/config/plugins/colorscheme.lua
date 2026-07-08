-- Colorscheme: follow the terminal by tracking the same light/dark signal
-- Ghostty uses (the macOS system appearance), and picking a matching scheme:
--   light -> gruvbox    (mirrors Ghostty's gruvbox-light)
--   dark  -> ayu-mirage (matches Ghostty's ayu-mirage)
-- Re-checks on focus/resume so it tracks OS theme changes without restarting.
return {
  { "folke/tokyonight.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim" },

  {
    "Shatur/neovim-ayu",
    priority = 1000, -- load early
    lazy = false,    -- ensures it loads on startup
    dependencies = { "ellisonleao/gruvbox.nvim" }, -- ensure gruvbox is loaded before we may switch to it
    config = function()
      local uv = vim.uv or vim.loop
      local is_macos = uv.os_uname().sysname == "Darwin"

      local function system_is_dark()
        if not is_macos then
          return vim.o.background == "dark" -- off macOS: fall back to nvim's own detection
        end
        -- On macOS the AppleInterfaceStyle key exists only in Dark mode.
        local out = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
        return vim.v.shell_error == 0 and out:match("Dark") ~= nil
      end

      local applied -- cache last state so we don't redraw on every focus event
      local function apply_theme()
        local dark = system_is_dark()
        if dark == applied then
          return
        end
        applied = dark
        if dark then
          vim.o.background = "dark"
          vim.cmd.colorscheme("ayu-mirage")
        else
          vim.o.background = "light"       -- forces gruvbox's LIGHT variant
          vim.cmd.colorscheme("gruvbox")
        end
      end

      apply_theme()

      -- Track OS light/dark changes: re-check when nvim regains focus or resumes.
      -- (Requires tmux `focus-events on`, set in ~/.tmux.conf.)
      vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, {
        group = vim.api.nvim_create_augroup("FollowTerminalTheme", { clear = true }),
        callback = apply_theme,
      })

      -- Manual re-sync, in case a theme flip doesn't trigger a focus event.
      vim.api.nvim_create_user_command("ThemeSync", apply_theme, {})
    end,
  },
}
