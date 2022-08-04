import os
from libqtile.config import Screen
from libqtile import qtile, widget, bar
from theme import colours, widget_theme

from keymaps import term

widgets_list = [
    # Icon
    widget.Sep(linewidth=0, padding=10, background=widget_theme["background"]),
    widget.Image(
        filename="~/config/qtile/.config/qtile/icons/fatpinkbob.png",
        scale="False",
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(term)},
        background=widget_theme["background"],
    ),
    widget.TextBox(
        text="|",
        font=widget_theme["font"],
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=2,
        fontsize=14,
    ),
    widget.GroupBox(
        font=widget_theme["font"],
        fontsize=32,
        margin_y=4,
        margin_x=3,
        padding_y=5,
        padding_x=8,
        borderwidth=3,
        active=colours["sumiInk4"],
        inactive=colours["sumiInk3"],
        rounded=False,
        highlight_color=colours["oniViolet"],
        highlight_method="line",
        this_current_screen_border=colours["oldWhite"],
        background=widget_theme["background"],
    ),
    widget.TextBox(
        text="|",
        font=widget_theme["font"],
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=2,
        fontsize=14,
    ),
    widget.WindowName(
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=12,
        fontsize=widget_theme["fontsize"],
        font=widget_theme["font"],
        empty_group_string="BobOS",
    ),
    widget.Sep(linewidth=0, padding=20, background=widget_theme["background"]),
    widget.CheckUpdates(
        foreground=widget_theme["foreground"],
        update_interval=20,
        distro="Arch_yay",
        colour_have_updates=colours["autumnRed"],
        colour_no_updates=widget_theme["foreground"],
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn("yay")
        },
        padding=0,
        fontsize=30,
        font=widget_theme["font"],
        display_format="",
        no_update_string="",
        background=widget_theme["background"],
    ),
    widget.CheckUpdates(
        foreground=widget_theme["foreground"],
        update_interval=20,
        distro="Arch_yay",
        colour_have_updates=colours["autumnRed"],
        colour_no_updates=widget_theme["foreground"],
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn("yay")
        },
        padding=10,
        fontsize=widget_theme["fontsize"],
        font=widget_theme["font"],
        display_format="{updates}",
        no_update_string="0",
        background=widget_theme["background"],
    ),
    widget.TextBox(
        text="",
        font=widget_theme["font"],
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=0,
        fontsize=16,
    ),
    widget.ThermalSensor(
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        foreground_alert=colours["peachRed"],
        threshold=90,
        font=widget_theme["font"],
        fontsize=widget_theme["fontsize"],
        padding=10,
    ),
    widget.TextBox(
        text="",
        font=widget_theme["font"],
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=0,
        fontsize=32,
    ),
    widget.Net(
        interface="eno1",
        format="{down} ↓↑{up}",
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=0,
        fontsize=16,
        font=widget_theme["font"],
        prefix="M",
    ),
    widget.TextBox(
        text="|",
        font=widget_theme["font"],
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=2,
        fontsize=14,
    ),
    #TODO: Implement Volume control
    # widget.Volume(
    #     foreground=widget_theme["foreground"],
    #     background=widget_theme["background"],
    #     padding=5,
    #     fontsize=24,
    #     font=widget_theme["font"],
    #     fmt='',
    # ),
    widget.Systray(background=widget_theme["background"], padding=2),
    widget.TextBox(
        text="|",
        font=widget_theme["font"],
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=2,
        fontsize=14,
    ),
    widget.Clock(
        foreground=widget_theme["foreground"],
        background=widget_theme["background"],
        padding=5,
        fontsize=widget_theme["fontsize"],
        font=widget_theme["font"],
    ),
]

screens = [
    Screen(
        top=bar.Bar(
            widgets_list,
            28,
        ),
    )
]
