# Copyright (C) 2017 Wind River Systems, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

# Add notification about checking local.conf after "--kernel" option
# is used.

setup_add_arg --kernel KERNEL
setup_shutdown_func kernel_warn_msg

kernel_warn_msg() {
    if [ -n "${KERNEL+x}" ]; then
        cat << EOF

Note: The "--kernel" option only adds
<LINUX_KERNEL_TYPE ??= "_your_kernel_setting_"> in local.conf, which
may not always take effect because of later "??=" or "?=" settings.
To make sure that your "--kernel" setting takes effect, please review the
local.conf file and adjust the setting as necessary. It may be necessary
to change the "??=" to "=". Such as:
LINUX_KERNEL_TYPE = "_your_kernel_setting_"

EOF
    fi
}
