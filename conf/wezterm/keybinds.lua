local wezterm = require("wezterm")
local act = wezterm.action

-- キーテーブルの状態をステータスバーに表示
wezterm.on(
    "update-right-status",
    function(window, pane)
        local name = window:active_key_table()
        if name then
            name = "TABLE: " .. name
        end
        window:set_right_status(name or "")
    end
)

return {
    keys = {
        -- コマンドパレット
        {key = "p", mods = "SUPER", action = act.ActivateCommandPalette},
        -- Tab 操作
        {key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(1)},
        {key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(-1)},
        {key = "t", mods = "SHIFT|CTRL", action = act({SpawnTab = "CurrentPaneDomain"})},
        {key = "w", mods = "SUPER", action = act({CloseCurrentTab = {confirm = true}})},
        -- Tab の並び替え
        {key = "PageDown", mods = "SHIFT|CTRL", action = act({MoveTabRelative = -1})},
        {key = "PageUp", mods = "SHIFT|CTRL", action = act({MoveTabRelative = 1})},
        -- フルスクリーン
        {key = "F11", mods = "", action = act.ToggleFullScreen},
        -- コピー&ペースト
        {key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard")},
        {key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard")},
        -- フォントサイズ調整
        {key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize},
        {key = "-", mods = "CTRL", action = act.DecreaseFontSize},
        {key = "0", mods = "CTRL", action = act.ResetFontSize},
        -- pane
        {key = "o", mods = "SHIFT|CTRL", action = act.SplitVertical({domain = "CurrentPaneDomain"})},
        {key = "e", mods = "SHIFT|CTRL", action = act.SplitHorizontal({domain = "CurrentPaneDomain"})},
        -- ペインを閉じる
        {key = "w", mods = "SHIFT|CTRL", action = act({CloseCurrentPane = {confirm = true}})},
        {key = "w", mods = "SHIFT|CMD", action = act({CloseCurrentTab = {confirm = true}})},
        {key = "q", mods = "SHIFT|CTRL", action = act.QuitApplication},
        -- ペイン移動
        {key = "p", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Next")},
        {key = "n", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Prev")},
        {key = "b", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left")},
        {key = "f", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right")},
        {key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right")},
        {key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left")},
        {key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up")},
        {key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down")},
        -- ペインのズーム（最大化/復元）
        {key = "z", mods = "LEADER", action = act.TogglePaneZoomState},
        -- ペインリサイズモード起動
        {key = "s", mods = "LEADER", action = act.ActivateKeyTable({name = "resize_pane", one_shot = false})},
        {key = "i", mods = "SHIFT|CTRL", action = act.SpawnWindow},
        -- Workspace 一覧表示
        {key = "w", mods = "LEADER", action = act.ShowLauncherArgs({flags = "WORKSPACES", title = "Select workspace"})},
        -- 現在の Workspace の名前を変更
        {
            key = "$",
            mods = "LEADER",
            action = act.PromptInputLine(
                {
                    description = "Set workspace title:",
                    action = wezterm.action_callback(
                        function(window, pane, line)
                            if line then
                                wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
                            end
                        end
                    )
                }
            )
        },
        -- 新しい Workspace を作成
        {
            key = "W",
            mods = "LEADER|SHIFT",
            action = act.PromptInputLine(
                {
                    description = "Create new workspace:",
                    action = wezterm.action_callback(
                        function(window, pane, line)
                            if line then
                                window:perform_action(
                                    act.SwitchToWorkspace(
                                        {
                                            name = line
                                        }
                                    ),
                                    pane
                                )
                            end
                        end
                    )
                }
            )
        },
        -- ペイン選択モード起動（タイムアウト付き）
        {
            key = "a",
            mods = "LEADER",
            action = act.ActivateKeyTable({name = "activate_pane", timeout_milliseconds = 1000})
        }
    },
    -- keybinds.lua の key_tables に追加
    key_tables = {
        resize_pane = {
            {key = "h", action = act.AdjustPaneSize({"Left", 1})},
            {key = "j", action = act.AdjustPaneSize({"Down", 1})},
            {key = "k", action = act.AdjustPaneSize({"Up", 1})},
            {key = "l", action = act.AdjustPaneSize({"Right", 1})},
            -- Enter でモード終了
            {key = "Enter", action = "PopKeyTable"}
        },
        activate_pane = {
            {key = "h", action = act.ActivatePaneDirection("Left")},
            {key = "j", action = act.ActivatePaneDirection("Down")},
            {key = "k", action = act.ActivatePaneDirection("Up")},
            {key = "l", action = act.ActivatePaneDirection("Right")}
        }
    }
}

-- -- keybinds.lua の keys に追加
-- { key = "[", mods = "LEADER", action = act.ActivateCopyMode },

-- -- key_tables に copy_mode を追加
-- copy_mode = {
--   -- カーソル移動
--   { key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
--   { key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
--   { key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
--   { key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },

--   -- 単語移動
--   { key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
--   { key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
--   { key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },

--   -- 行頭/行末
--   { key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
--   { key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
--   { key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },

--   -- ジャンプ
--   { key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
--   { key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
--   { key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
--   { key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },

--   -- スクロール
--   { key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
--   { key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
--   { key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
--   { key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },

--   -- 選択モード
--   { key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
--   { key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
--   { key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },

--   -- コピー
--   { key = "y", mods = "NONE", action = act.CopyTo("Clipboard") },

--   -- コピーモード終了
--   {
--     key = "Enter",
--     mods = "NONE",
--     action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
--   },
--   { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
--   { key = "q", mods = "NONE", action = act.CopyMode("Close") },
-- },
