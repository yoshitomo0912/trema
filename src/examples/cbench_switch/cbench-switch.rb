#
# A simple openflow controller for benchmarking.
#
# Copyright (C) 2008-2013 NEC Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#


class CbenchSwitch < Controller
  def packet_in(datapath_id, message)
    send_flow_mod_add(
      datapath_id,
      :cookie => 0,
      :match => ExactMatch.from(message),
      :buffer_id => message.buffer_id,
      :actions => ActionOutput.new(:port => message.in_port + 1)
    )
  end
end


### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End:
