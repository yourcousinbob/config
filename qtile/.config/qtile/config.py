# -*- coding: utf-8 -*-
import subprocess
from libqtile.log_utils import logger
from libqtile import hook

from groups import *
from keymaps import *
from layouts import *
from widgets import *

@hook.subscribe.startup_once
def autostart():
    subprocess.call(['./autostart.sh'])
